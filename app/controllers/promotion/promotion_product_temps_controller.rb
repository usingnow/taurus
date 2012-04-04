class Promotion::PromotionProductTempsController < ApplicationController
  before_filter :authenticate_administrator!

  layout "empty"

  def index
    @member_type = params[:member_type]
    @promotion_member_temps = PromotionMemberTemp.find_all_by_administrator_id_and_member_type(current_administrator.id, @member_type)
    if @member_type == "1"
      @roles = Role.all
      render "role_index"
    else
      @search = User.search(params[:q])
      @users = @search.result.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def create
    @promotion_member_temp = PromotionMemberTemp.new(:member_type => params[:member_type],
                                                     :member_info => params[:member_info],
                                                     :administrator_id => current_administrator.id)
    @promotion_member_temp.save
    redirect_to :back
  end

  def destroy
    @promotion_member_temp = PromotionMemberTemp.find(params[:id])
    @promotion_member_temp.destroy
    redirect_to :back
  end
end