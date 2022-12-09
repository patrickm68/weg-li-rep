# frozen_string_literal: true

require "csv"
require "zip"

class Scheduled::ExportJob < ApplicationJob
  def perform(export_type: :notices, interval: Date.today.cweek)
    Rails.logger.info(
      "create export for type #{export_type} in week #{interval}"
    )

    export = Export.new(export_type:, interval:)
    name = export.display_name.parameterize

    archive =
      Zip::OutputStream.write_buffer do |stream|
        stream.put_next_entry("#{name}.csv")
        stream.print(export.header.to_csv)
        export.data { |data| stream.print(data.to_csv) }
      end
    archive.rewind

    export.save!
    export.archive.attach(
      io: archive,
      filename: "#{name}.zip",
      content_type: "application/zip"
    )
  end
end
