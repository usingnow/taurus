#encoding:UTF-8
class Taurus::Admin::SkuDisplaysController < ApplicationController
  before_filter :authenticate_administrator!
  #authorize_resource
  helper 'taurus/sku_displays'

  def index
    data = YAML.load(File.open(Rails.root+"lib/data/sku_display.yml"))
    @page = data.find { |d| d['id'].to_s == params[:page] ||= "0" }
  end


  def new
    @sku_displays = Taurus::SkuDisplay.find_all_by_page_and_location(params[:page_id], params[:location_id])
    @search = Sku.search(params[:q])
    @skus = @search.result.paginate(:page => params[:page], :per_page => 10)
    @sku_display = Taurus::SkuDisplay.new(:page => params[:page_id], :location => params[:location_id])
  end


  def create
    @sku_display = Taurus::SkuDisplay.new(params[:sku_display])
    @sku_display.sequence = 0
    if @sku_display.save
      redirect_to :back
    else
      redirect_to :back, :alert => @sku_display.errors
    end
  end

  def update
    @sku_display = Taurus::SkuDisplay.find(params[:id])
    if @sku_display.update_attribute(:sequence,params[:sequence])
      render :json => "更改成功".to_json
    else
      render :json => "更改失败".to_json
    end
  end


  def destroy
    @sku_display = Taurus::SkuDisplay.find(params[:id])
    @sku_display.destroy

    redirect_to :back
  end

end
