class Commodity::SkuDisplaysController < ApplicationController
  # GET /sku_displays
  # GET /sku_displays.json
  def index
    @sku_displays = SkuDisplay.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sku_displays }
    end
  end

  # GET /sku_displays/1
  # GET /sku_displays/1.json
  def show
    @sku_display = SkuDisplay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sku_display }
    end
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
end
