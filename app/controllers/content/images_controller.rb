class Content::ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find params[:id]
  end

  def show
    @image = Image.find params[:id]
  end

  def create
    @image = Image.new params[:image]

    @image.save

    redirect_to content_images_url
  end

  def destroy
    @image = Image.find params[:id]
    @image.destroy

    redirect_to content_images_url
  end
end