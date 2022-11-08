# frozen_string_literal: true

require 'spec_helper'

describe 'replies', type: :request do
  let(:user) { Fabricate(:user) }
  let(:notice) { Fabricate(:notice, user:) }
  let(:reply) { Fabricate(:reply, notice:) }

  before do
    login(user)
  end

  context 'GET :index' do
    it 'index works' do
      get replies_path

      expect(response).to be_ok
    end
  end
end
