class Commodity::SkuDisplaysController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @search = SkuDisplay.search(params[:q])
    @sku_displays = @search.result.paginate(:page => params[:page], :per_page => 20)
  end


  def show
    @sku_display = SkuDisplay.find(params[:id])
  end


  def new
    @sku_display = SkuDisplay.new
    @sku_display.sequence = 0
  end


  def edit
    @sku_display = SkuDisplay.find(params[:id])
    @sku_display.sku_number = @sku_display.sku.number
  end


  def create
    @sku_display = SkuDisplay.new(params[:sku_display])
    @sku_display.sku_id = Sku.find_by_number(params[:sku_display][:sku_number]).id

    if @sku_display.save
      redirect_to commodity_sku_displays_url
    else
      render action: "new"
    end
  end


  def update
    @sku_display = SkuDisplay.find(params[:id])
    @sku_display.sku_id = Sku.find_by_number(params[:sku_display][:sku_number]).id

    if @sku_display.update_attributes(params[:sku_display])
      redirect_to commodity_sku_displays_url
    else
      render action: "edit"
    end
  end

  def destroy
    @sku_display = SkuDisplay.find(params[:id])
    @sku_display.destroy

    redirect_to commodity_sku_displays_url
  end

  def change_page
    @locations = SkuDisplay.new.location_enum(params[:page].to_i)
    render :json => @locations.to_json
  end
end
