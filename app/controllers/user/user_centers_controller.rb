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
    @mail_sale = MailSale.new
  end

  def add_mail_sales
    @mail_sale = current_user.build_mail_sale(params[:mail_sale])

    if @mail_sale.save
      redirect_to mail_sales_user_user_centers_url, :notice => "提交成功！"
    else
      render "mail_sales"
    end
  end

  def comments

  end

  def my_favorites
    if params[:category_id]
      @favorites = current_user.favorites.where("sku_id in (select id from skus where sku_category_id = ?)", params[:category_id])
      .paginate(:page => params[:page], :per_page => 10)
    else
      @favorites = current_user.favorites.paginate(:page => params[:page], :per_page => 10)
    end

    @categories = SkuCategory.find_by_sql("select * from sku_categories where id in(select sku_category_id from skus
      inner join favorites on skus.id = favorites.sku_id and user_id = #{current_user.id})")
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
    @order_pay = OrderPay.new
    @order_pay.order_id = params[:id]
    @condition_id = params[:condition_id]
  end

  def add_remit_payment_info
    @order = Order.find(params[:id])
    @condition_id = params[:condition_id]
    @order_pay = @order.build_order_pay
    OrderPay.transaction do
      if @order_pay.save
        order_cross_station @order, :condition_id => @condition_id
        redirect_to user_user_centers_url
      else
        render "remit_payment_info"
      end
    end
  end

  def cancel
    @order = Order.find(params[:id])
    @condition_id = params[:condition_id]

    Order.transaction do
      order_cross_station @order, :condition_id => @condition_id
    end

    redirect_to user_user_centers_url
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