class User::ConsigneeInfosController < ApplicationController
  before_filter :authenticate_user!

  def index
    user_id = current_user.id
    @consignee_info = ConsigneeInfo.find_by_user_id user_id
    if @consignee_info.nil?
      @consignee_info = ConsigneeInfo.new
    end

    if params[:consignee_modify] == "close"
      render :partial => "consignee_info"
    else
      @user_addresses = UserAddress.find_all_by_user_id(user_id)
      render :partial => "consignee_modify"
    end
  end

  def create
    user_id = current_user.id
    consignee_info = ConsigneeInfo.find_by_user_id user_id
    if consignee_info.nil?
      consignee_info = ConsigneeInfo.new params[:consignee_info]
      consignee_info.user_id = user_id
      consignee_info.save
    else
      consignee_info.update_attributes params[:consignee_info]
    end

    if consignee_info.errors.any?
      render :json => "failure".to_json
    else
      consignee_info.district_no = consignee_info.district.address
      render :json => consignee_info.to_json
    end
  end
end