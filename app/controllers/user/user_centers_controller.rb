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

  def reset_pwd

  end

  def user_addresses

  end
end