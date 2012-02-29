class Content::ImagesController < ApplicationController
  def index
    @search = Image.search(params[:q])
    @images = @search.result.paginate(:page => params[:page], :per_page => 20)
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


  def change_page
    @locations = Image.new.location_enum(params[:page].to_i)
    render :json => @locations.to_json
  end
end