class Promotion::PromotionProductTempsController < ApplicationController
  before_filter :authenticate_administrator!

  layout "empty"

  def index
    @promotion_product_temps = PromotionProductTemp.find_all_by_administrator_id_and_products_selection(current_administrator.id, params[:products_selection])
    if params[:products_selection] == "1"
      @search = SkuCategory.search(params[:q])
      @categories = @search.result.paginate(:page => params[:page], :per_page => 10)
      render "category_index"
    elsif params[:products_selection] == "2"
      @search = Brand.search(params[:q])
      @brands = @search.result.paginate(:page => params[:page], :per_page => 10)
      render "brand_index"
    else
      @search = Sku.search(params[:q])
      @skus = @search.result.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def create
    @promotion_product_temp = PromotionProductTemp.new(:products_selection => params[:products_selection],
                                                     :selection_parameter => params[:selection_parameter],
                                                     :administrator_id => current_administrator.id)
    @promotion_product_temp.save
    redirect_to :back
  end

  def destroy
    @promotion_product_temp = PromotionProductTemp.find(params[:id])
    @promotion_product_temp.destroy
    redirect_to :back
  end
end