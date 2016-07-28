require 'rails_helper'

describe ImagesController do
  let!(:image) { FactoryGirl.create(:image) }
  let!(:user) { login_user }

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
      it 'saves the new contact in the database' do
        post :create, id: image
        expect(Image.last).to eq(image)
      end
      it 'redirects to the home page' do
        post :create, id: image
        expect(response).to redirect_to 'http://test.host/images'
      end
    end
  end
end
