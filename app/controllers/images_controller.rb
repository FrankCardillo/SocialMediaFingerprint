class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params_bar)
    @image.user = current_user
    if @image.save
      flash[:notice] = 'Image successfully saved!'
    else
      flash[:error] = @image.errors.full_messages.join(', ')
    end
    redirect_to images_path
  end

  private

  def params_image
    params.require(:image).permit(:image_url)
  end
end
