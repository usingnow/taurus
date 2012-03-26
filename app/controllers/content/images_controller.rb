class Content::ImagesController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

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

  def update
    @image = Image.find params[:id]
    if @image.update_attributes params[:image]
      redirect_to content_images_url
    else
      render "edit"
    end
  end

  def create
    @image = Image.new params[:image]

    if @image.save
      redirect_to content_images_url
    else
      render "new"
    end
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