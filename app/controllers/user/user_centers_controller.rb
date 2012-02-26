#encoding:UTF-8
class User::UserCentersController < ApplicationController
  layout "home"
  before_filter :authenticate_user!

  def index
    @orders = current_user.orders.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end

  def detailed_p_user_info

  end

  def detailed_e_user_info

  end

  def mail_sales

  end

  def comments

  end

  def my_favorites

  end

  def my_points

  end

  def order_query
    @search = current_user.orders.search(params[:q])
    @search.sorts = "created_at desc"
    @orders = @search.result.paginate(:page => params[:page],:per_page => 10)
  end

  def sku_query

  end


  def user_addresses
    @user_addresses = current_user.user_addresses.paginate(:page => params[:page], :per_page => 10)
  end

  def edit_user_address
    @user_address = current_user.user_addresses.find(params[:id])
  end

  def del_user_address

  end

  def new_user_address
    @user_address = current_user.user_addresses.build
  end

  def order_show
    @order = current_user.orders.find params[:id]
    @consignee_info = current_user.consignee_info

  end

  def order_edit

  end

  def remit_payment_info

  end

  def edit_p_user_info
    @user_info = current_user
    @person_extend = @user_info.build_person_extend
  end

  def edit_e_user_info
    @user_info = current_user
    @company_extend = @user_info.build_company_extend
  end
end