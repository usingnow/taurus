class Promotion::OnlinePromotionsController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @search = OnlinePromotion.search(params[:q])
    @search.sorts = "updated_at desc"
    @online_promotions = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @online_promotion = OnlinePromotion.find(params[:id])
    if @online_promotion.online_promotionable_type == "PromotionByOrder"
      render "promotion/promotion_by_orders/show"
    else
      render "promotion/promotion_by_products/show"
    end
  end

  def search_skus
    @search = Sku.search(params[:q])
    @search.sorts = "updated_at desc"
    @skus = @search.result.paginate(:page => params[:page], :per_page => 20)
    render "search_skus", :layout => "empty"
  end
end