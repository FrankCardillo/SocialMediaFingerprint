require 'rails_helper'

describe ImagesController do
  let!(:image) { FactoryGirl.create(:image) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'populates an array of images' do
      get :index
      expect(assigns(:images)).to eq [image]
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'assigns a new image to @image' do
      get :new
      expect(assigns(:image)).to be_a_new Image
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end

    it 'assigns a FacebookApi instance to @fb_data' do
      get :new
      expect(assigns(:fb_data)).to be_a FacebookApi
    end

    it 'assigns a CoordinateCreator instance to coord_creator' do
      get :new
      expect(assigns(:coord_creator)).to be_a CoordinateCreator
    end

    it 'assigns a fractal params hash to @fractal_params' do
      get :new
      expect(assigns(:fractal_params).class).to eq Hash
      expect(assigns(:fractal_params).length).to eq 7
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:new_image_params) { fixture_file_upload('test.png', 'image/png') }

      it 'saves the new Image in the database' do
        expect { post :create, image_url: new_image_params }.to change{
          Image.count
        }.by(1)
        uploaded_image = Image.last
        expect(uploaded_image.image_url).to_not be_nil
        expect(uploaded_image.user).to eq user
      end

      it 'redirects to the home page' do
        post :create, image: new_image_params
        expect(response).to redirect_to 'http://test.host/images'
      end
    end
  end
end
