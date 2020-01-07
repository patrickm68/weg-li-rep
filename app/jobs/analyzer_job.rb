class AnalyzerJob < ApplicationJob
  class NotYetAnalyzedError < StandardError; end

  def self.time_from_filename(filename)
    token = filename[/.*(20\d{6}_\d{6})/, 1]
    token ||= filename[/.*(20\d{2}-\d{2}-\d{2}_\d{2}-\d{2}-\d{2})/, 1]

    return nil unless token
    Time.zone.parse(token.gsub('-', '')) rescue nil
  end

  retry_on NotYetAnalyzedError, attempts: 15, wait: :exponentially_longer

  queue_as :default

  def perform(notice)
    Rails.logger.info("current connection is #{ActiveRecord::Base.connection_config[:pool]}")

    raise NotYetAnalyzedError unless notice.photos.all?(&:analyzed?)

    analyze(notice)
  end

  def analyze(notice)
    plates = []
    brands = []
    colors = []
    dates = []

    notice.data ||= {}
    notice.photos.each do |photo|
      notice.latitude ||= photo.metadata[:latitude] if photo.metadata[:latitude].to_f.positive?
      notice.longitude ||= photo.metadata[:longitude] if photo.metadata[:longitude].to_f.positive?
      dates << (photo.metadata[:date_time].to_s.to_time || AnalyzerJob.time_from_filename(photo.filename.to_s))

      result = annotator.annotate_object(photo.key)
      if result.present?
        if Annotator.unsafe?(result)
          Rails.logger.info("safe search violated for notice #{notice.id} with photo #{photo.id}")
          notice.user.update(access: :disabled)
        end

        notice.data[photo.record_id] = result
        plates += Annotator.grep_text(result) { |string| Vehicle.plate?(string) }
        brands += Annotator.grep_text(result) { |string| Vehicle.brand?(string) }
        brands += Annotator.grep_label(result) { |string| Vehicle.brand?(string) }
        colors += Annotator.dominant_colors(result)
      end
    end

    notice.apply_dates(dates)

    most_likely_registraton = Vehicle.most_likely?(plates)
    notice.apply_favorites(most_likely_registraton)

    notice.registration ||= most_likely_registraton
    notice.brand ||= Vehicle.most_likely?(brands)
    notice.color ||= Vehicle.most_likely?(colors)

    notice.handle_geocoding
    notice.status = :open
    notice.save_incomplete!
  end

  private

  def annotator
    @annotator ||= Annotator.new
  end
end
