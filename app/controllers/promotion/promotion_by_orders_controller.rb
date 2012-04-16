#encoding:UTF-8
class Promotion::PromotionByOrdersController < ApplicationController
  before_filter :authenticate_administrator!

  def new
    @promotion_by_order = PromotionByOrder.new
    @online_promotion = @promotion_by_order.build_online_promotion
  end

  def preview
    @promotion_by_order = PromotionByOrder.new(params[:promotion_by_order])
    @promotion_by_order.online_promotion.status = 0
    @promotion_by_order.online_promotion.current_step = "preview"
    @promotion_by_order.online_promotion.administrator_id = current_administrator.id
    render "new" unless @promotion_by_order.valid?
  end

  def create
    @promotion_by_order = PromotionByOrder.new(params[:promotion_by_order])
    if params[:commit] == "返回修改"
      render "new"
    else
      @promotion_by_order.online_promotion.status = 0
      @promotion_by_order.online_promotion.current_step = "save"
      @promotion_by_order.online_promotion.administrator_id = current_administrator.id
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

  def update
    @promotion_by_order = PromotionByOrder.find(params[:id])
    @promotion_by_order.online_promotion.administrator_id = current_administrator.id
    @online_promotion = @promotion_by_order.online_promotion
    flag = false
    PromotionByOrder.transaction do
      if @promotion_by_order.update_attributes(params[:promotion_by_order])
        if @promotion_by_order.online_promotion.member_type != 0
          PromotionMember.destroy_all(:online_promotion_id => @promotion_by_order.online_promotion.id)
          current_administrator.promotion_member_temps.find_all_by_member_type(@promotion_by_order.online_promotion.member_type).each do |temp|
            PromotionMember.create(:member_info => temp.member_info, :online_promotion_id => @promotion_by_order.online_promotion.id)
          end
        end

        PromotionProductTemp.destroy_all(:administrator_id => current_administrator.id)
        PromotionMemberTemp.destroy_all(:administrator_id => current_administrator.id)
        flag = true
      else
        flag = false
      end
    end

    if flag
      redirect_to promotion_online_promotion_path(@online_promotion)
    else
      render "edit"
    end
  end

end