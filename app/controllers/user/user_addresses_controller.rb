class User::UserAddressesController < ApplicationController
  before_filter :authenticate_user!

  def create
    user_id = current_user.id
    user_addresses = UserAddress.find_all_by_user_id_and_name_and_district_no_and_address(
        user_id,params[:consignee_info][:name],params[:consignee_info][:district_no],params[:consignee_info][:address])
    if user_addresses.any?
      render :json => "failure".to_json
    else
      user_addresses = UserAddress.new params[:consignee_info]
      user_addresses.user_id = user_id
      user_addresses.save
      @user_addresses = UserAddress.find_all_by_user_id user_id
      render :partial => "user_addresses"
    end
  end

  def destroy
    user_address = UserAddress.find params[:id]
    user_address.destroy
    @user_addresses = UserAddress.find_all_by_user_id current_user.id

    render :partial => "user_addresses"
  end
end