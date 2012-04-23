class Taurus::Admin::ImagesController < ApplicationController
  before_filter :authenticate_administrator!
  #authorize_resource
  helper 'taurus/images'

  def index
    @search = Taurus::Image.search(params[:q])
    @images = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @image = Taurus::Image.new
  end

  def edit
    @image = Taurus::Image.find params[:id]
  end

  def show
    @image = Taurus::Image.find params[:id]
  end

  def update
    @image = Taurus::Image.find params[:id]
    if @image.update_attributes params[:image]
      redirect_to admin_images_url
    else
      render "edit"
    end
  end

  def create
    @image = Taurus::Image.new params[:image]

    if @image.save
      redirect_to admin_images_url
    else
      render "new"
    end
  end

  def destroy
    @image = Taurus::Image.find params[:id]
    @image.destroy

    redirect_to admin_images_url
  end


  def change_page
    @locations = Taurus::Image.new.location_enum(params[:page].to_i)
    render :json => @locations.to_json
  end
end
