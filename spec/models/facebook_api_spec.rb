require 'rails_helper'

describe FacebookApi do
  let(:test_app_id) { '1705011599760572' }
  let(:test_app_secret) { '732386bd8494d6057e2b04ad24b02cc5' }
  let(:test_users) do
    Koala::Facebook::TestUsers.new(
      #app_id: ENV['FACEBOOK_APP_ID'], secret: ENV['FACEBOOK_APP_SECRET']
      app_id: test_app_id, secret: test_app_secret
    )
  end
  let(:user) { test_users.create(true) }
  let(:user_graph_api) { Koala::Facebook::API.new(user['access_token']) }
  let(:fb_data) { FacebookApi.new(user['access_token'], test_app_secret) }

  describe '#initialize' do
    it 'data is a hash' do
      expect(fb_data.data.class).to eq(Hash)
    end
  end

  describe '#graph' do
    it 'data hash has the correct data about the user' do
      expect(fb_data.data['first_name']).to eq(
        user_graph_api.get_object('me?fields=first_name')['first_name']
      )

      expect(fb_data.data['gender']).to eq(
        user_graph_api.get_object('me?fields=gender')['gender']
      )
    end
  end
end
