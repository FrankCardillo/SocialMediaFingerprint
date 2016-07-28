require 'rails_helper'

describe CoordinateCreator do
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
  let(:coord_creator) { CoordinateCreator.new(fb_data.data) }

  describe '#initialize' do
    it 'data_hash is a hash' do
      expect(coord_creator.data_hash.class).to eq(Hash)
    end

    it 'calls #main_converter' do
      expect(coord_creator.fractal_parameters).to eq({
        x: coord_creator.start_x,
        y: coord_creator.start_y,
        radius: coord_creator.radius,
        size: coord_creator.ellipse_size,
        base_case: coord_creator.base_case,
        rate: coord_creator.expansion_rate,
        color: coord_creator.color
      })
    end
  end

  describe '#fractalParams' do
    it 'returns a hash' do
      expect(coord_creator.fractal_parameters.class).to eq(Hash)
    end

    it 'contains all the data needed to generate fractal art' do
      expect(coord_creator.fractal_parameters.length).to eq(7)
    end
  end
end
