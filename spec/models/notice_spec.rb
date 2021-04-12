require 'spec_helper'

describe Notice do
  let(:notice) { Fabricate.build(:notice) }

  context "validation" do
    it "is valid" do
      expect(notice).to be_valid
      expect(notice.photos.first.filename.to_s).to eql('mercedes.jpg')
    end

    it "validates the date" do
      expect(notice).to be_valid
      notice.date = 2.minutes.from_now
      expect(notice).to_not be_valid
      notice.date = 2.months.ago
      expect(notice).to be_valid
      notice.date = 4.months.ago
      expect(notice).to_not be_valid
    end
  end

  context "wegli_email" do
    it "creates and reads the proper notice" do
      notice =  Fabricate.create(:notice)

      email_address = notice.wegli_email
      notice = Notice.from_email_address(email_address)
      expect(notice).to eql(notice)
    end
  end

  context "duplication" do
    it "duplicates a notice" do
      notice = Fabricate(:notice)

      expect {
        notice.duplicate!
      }.to change {
        Notice.count
      }.by(1)
    end
  end

  context "apply_favorites" do
    it "applies favorites" do
      existing_notice = Fabricate.create(:notice, status: :shared, registration: 'HH PS 123', user: notice.user)

      empty_notice = Notice.new(user: notice.user)
      empty_notice.apply_favorites(['HH PS 123'])

      expect(empty_notice.registration).to eql('HH PS 123')
      expect(empty_notice.charge).to eql(existing_notice.charge)
      expect(empty_notice.severity).to eql(existing_notice.severity)
      expect(empty_notice.duration).to eql(existing_notice.duration)
      expect(empty_notice.brand).to eql(existing_notice.brand)
      expect(empty_notice.color).to eql(existing_notice.color)
      expect(empty_notice.flags).to eql(existing_notice.flags)
      expect(empty_notice.note).to eql(existing_notice.note)
    end
  end

  context "incomplete" do
    it "is incomplete" do
      expect(notice).to be_complete
      notice.charge = nil
      expect(notice).to be_invalid
      notice.save_incomplete!
      expect(notice.reload).to be_incomplete
    end
  end

  context "postgis" do
    it "finds closest match" do
      Fabricate.times(5, :notice, status: :shared)

      nearest = Notice.nearest_charges(notice.latitude, notice.longitude)
      expect(nearest.first.keys).to eql(["charge", "count", "distance", "diff"])
    end
  end

  context "defaults" do
    it "is valid" do
      notice = Fabricate(:notice)

      expect(notice).to be_open
      expect(notice.token).to be_present
    end
  end

  context "scopes" do
    it "finds_for_reminder" do
      notice = Fabricate(:notice, date: 15.days.ago)

      expect(Notice.for_reminder.to_a).to eql([notice])
      notice.user.update! disable_reminders: true
      expect(Notice.for_reminder).to be_empty
    end
  end

  context "statistics" do
    it "calculates statistics" do
      notice = Fabricate(:notice)

      statistics = Notice.statistics
      expect(
        {
          notices: 1,
          users: 1,
          districts: 1,
          photos: 1,
          shared: 0,
          active: 1,
        }
      ).to eql(statistics)
    end
  end

  context "yearly_statistics" do
    it "calculates yearly_statistics" do
      notice = Fabricate(:notice)

      limit = 5
      yearly_statistics = Notice.yearly_statistics(2020, limit)
      expect(
        {
          active: 0,
          count: 0,
          grouped_brands: [],
          grouped_charges: [],
          grouped_cities: [],
          grouped_states: [],
          grouped_zips: [],
          grouped_registrations: [],
        }
      ).to eql(yearly_statistics)
    end
  end
end
