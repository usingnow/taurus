#encoding:UTF-8
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

  def edit
    @online_promotion = OnlinePromotion.find(params[:id])

    if @online_promotion.member_type != 0
      @online_promotion.promotion_members.each do |m|
        PromotionMemberTemp.create(:member_type => @online_promotion.member_type,
                                    :member_info => m.member_info, :administrator_id => current_administrator.id)
      end
    end

    if @online_promotion.online_promotionable_type == "PromotionByOrder"
      render "promotion/promotion_by_orders/show"
    else
      @promotion_by_product = @online_promotion.online_promotionable

      if @promotion_by_product.products_selection != 0
        @online_promotion.promotion_products.each do |p|
          PromotionProductTemp.create(:products_selection => @promotion_by_product.products_selection,
                                      :selection_parameter => p.product_info, :administrator_id => current_administrator.id)
        end
      end
      render "promotion/promotion_by_products/edit"
    end
  end

  def search_skus
    @search = Sku.search(params[:q])
    @search.sorts = "updated_at desc"
    @skus = @search.result.paginate(:page => params[:page], :per_page => 20)
    render "search_skus", :layout => "empty"
  end

  def release
    @online_promotion = OnlinePromotion.find(params[:id])
    @online_promotion.update_attribute(:status,1)
    redirect_to promotion_online_promotion_url(@online_promotion), :notice => "发布成功"
  end

  def close_view
    @online_promotion = OnlinePromotion.find(params[:id])
    render "close_view", :layout => "empty"
  end

  def close
    @online_promotion = OnlinePromotion.find(params[:id])
    @online_promotion.current_step = "close"
    if @online_promotion.update_attributes(:status => 2, :remarks => params[:online_promotion][:remarks])
      render "close_view", :layout => "empty"
    else
      @online_promotion.status = 0
      render "close_view", :layout => "empty"
    end
  end

  def priorities
    @online_promotion = OnlinePromotion.find(params[:id])
    @high_priorities = PromotionPriority.find_all_by_promotion_low(@online_promotion.id)
    @low_priorities = PromotionPriority.find_all_by_promotion_high(@online_promotion.id)
  end
end