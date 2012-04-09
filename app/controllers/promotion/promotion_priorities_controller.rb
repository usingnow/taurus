class Promotion::PromotionPrioritiesController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @priorities = params[:priorities]
    @online_promotion = OnlinePromotion.find(params[:online_promotion_id])
    @not_in_priorities = OnlinePromotion.not_in_priorities(params[:online_promotion_id]).paginate(:page => params[:page], :per_page => 20)
    render "index", :layout => "empty"
  end

  def create
    if params[:priorities] == "high"
      high = params[:id]
      low = params[:online_promotion_id]
    else
      high = params[:online_promotion_id]
      low = params[:id]
    end
    @promotion_priority = PromotionPriority.new(:promotion_high => high, :promotion_low => low)
    @promotion_priority.save
    redirect_to promotion_online_promotion_promotion_priorities_url(:priorities =>  params[:priorities])
  end

  def destroy
    @promotion_priority = PromotionPriority.find(params[:id])
    @promotion_priority.destroy
    redirect_to priorities_promotion_online_promotion_url(params[:online_promotion_id])
  end
end