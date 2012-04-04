#encoding:UTF-8
class Promotion::PromotionByOrdersController < ApplicationController
  before_filter :authenticate_administrator!

  def new
    @promotion_by_order = PromotionByOrder.new
    @online_promotion = @promotion_by_order.build_online_promotion
  end

  def preview
    @promotion_by_order = PromotionByOrder.new(params[:promotion_by_order])
    if @promotion_by_order.valid?
    else
      render "new"
    end
  end

  def create
    @promotion_by_order = PromotionByOrder.new(params[:promotion_by_order])
    if params[:commit] == "返回修改"
      render "new"
    else
      @promotion_by_order.online_promotion.status = 0
      if @promotion_by_order.online_promotion.member_type != 0
        current_administrator.promotion_member_temps.find_all_by_member_type(@promotion_by_order.online_promotion.member_type).each do |temp|
          @promotion_by_order.promotion_members << PromotionMember.new(:member_info => temp.member_info)
        end
      end

      if @promotion_by_order.save
        PromotionMemberTemp.destroy_all(:administrator_id => current_administrator.id)
        redirect_to promotion_online_promotions_url
      else
        render "new"
      end
    end
  end



end