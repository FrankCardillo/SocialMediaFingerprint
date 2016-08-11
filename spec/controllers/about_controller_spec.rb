require 'rails_helper'

describe AboutController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
end
