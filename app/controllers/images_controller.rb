class ImagesController < ApplicationController
  def index
    @images = Image.all.order(user_id: :desc)
  end

  def new
    @image = Image.new
    if Rails.env.test?
      @fb_data = FacebookApi.new(current_user.access_token, '732386bd8494d6057e2b04ad24b02cc5')
    else
      @fb_data = FacebookApi.new(current_user.access_token, ENV['FACEBOOK_APP_SECRET'])
    end
    @coord_creator = CoordinateCreator.new(@fb_data.data)
    @fractal_params = @coord_creator.fractal_parameters
  end

  def create
    if current_user.image
      current_user.image.delete
    end
    @image = Image.new({image_url: params[:image_url]})
    @image.user = current_user

    if @image.save
      flash[:notice] = 'Image successfully saved!'
    else
      flash[:error] = @image.errors.full_messages.join(', ')
    end
    redirect_to images_path
  end
end
