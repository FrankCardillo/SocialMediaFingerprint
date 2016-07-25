require 'rails_helper'

describe FacebookApi do
  let(:test_users) { Koala::Facebook::TestUsers.new(app_id: ENV['FACEBOOK_APP_ID'], secret: ENV['FACEBOOK_APP_SECRET']) }
  let(:user) { test_users.create(true) }
  let(:user_graph_api) { Koala::Facebook::API.new(user['access_token']) }
  let(:fb_data) { FacebookApi.new(user['access_token']) }

  describe 'gets data about the user from facebook' do
    it 'data is a hash' do
      expect(fb_data.data.class).to eq(Hash)
    end

    it 'data hash has the correct data about the user' do
      expect(fb_data.data['first_name']).to eq(user_graph_api.get_object('me?fields=first_name')['first_name'])
      expect(fb_data.data['gender']).to eq(user_graph_api.get_object('me?fields=gender')['gender'])
    end
  end
end
