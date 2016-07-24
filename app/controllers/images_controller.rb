class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
    @fb_data = FacebookApi.new(current_user.access_token)
    @derp = @fb_data.data
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
