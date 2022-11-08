# frozen_string_literal: true

require 'spec_helper'

describe NoticeMailer do
  let(:notice) { Fabricate(:notice) }
  let(:user) { notice.user }

  before do
    stub_request(:get, /images\.weg\.li/).to_return(status: 200, body: file_fixture('truck.jpg').read)
  end

  describe 'charge' do
    it 'renders the mail' do
      mail = NoticeMailer.charge(notice)

      expect(mail.subject).to match('Anzeige')
      expect(mail.to).to eq([notice.district.email])
      expect(mail.cc).to eq([user.email])
      expect(mail.reply_to).to eq([user.email])
      expect(mail.attachments.size).to be(1)
    end

    it 'sends mail to' do
      mail = NoticeMailer.charge(notice, to: 'testo@pesto.de')

      expect(mail.to).to eq(['testo@pesto.de'])
    end

    it 'sends mail with PDF' do
      mail = NoticeMailer.charge(notice, send_via_pdf: true)

      expect(mail.attachments.first.filename).to match(/.*\.pdf/)
    end

    it 'sends mail with winowig config' do
      notice.district.update! config: :winowig
      mail = NoticeMailer.charge(notice)

      expect(mail.attachments.size).to be(3)
      expect(mail.attachments.first.filename).to match(/.*\.pdf/)
      expect(mail.attachments.second.filename).to match(/.*\.xml/)
      expect(mail.attachments.last.filename).to match(/.*\.jpg/)
    end
  end

  describe 'forward' do
    let(:token) { 'adlsfkjadskfjhdshkajndfasl' }
    it 'renders the mail' do
      mail = NoticeMailer.forward(notice, token)

      expect(mail.subject).to match('Meldung übertragen')
      expect(mail.to).to eq([user.email])
    end
  end
end
