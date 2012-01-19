#encoding:UTF-8
class Order::BackOrdersController < ApplicationController
  def index

  end

  def new
    @user = User.new
    @date = Time.now.strftime("%Y-%m-%d")
    @search = Sku.search(params[:q])
  end

  #内部 新建订单 用户搜索
  def user
    @user = User.find_by_login_no(params[:user][:index])
    if @user.nil?
      user = CompanyExtend.find_by_company_no(params[:user][:index])
      if user.nil?
        user = PersonExtend.find_by_person_no(params[:user][:index])
      end
      if user.nil?
        @user = User.new
        @user.errors.add(:index, "不存在")
      else
        @user = User.find(user.user_id)
      end

    end
    @date = Time.now.strftime("%Y-%m-%d")
  end





  def preview
    user_id = params[:user_id]

    @inner_order_payment = InnerOrderPayment.find_by_user_id(user_id)
    if @inner_order_payment.nil?
      @inner_order_payment = InnerOrderPayment.new(params[:inner_order_payment])
      @inner_order_payment.user_id = user_id
      @inner_order_payment.save
    else
      @inner_order_payment.update_attributes(params[:inner_order_payment])
    end

    @inner_order_address = InnerOrderAddress.find_by_user_id(user_id)
    if @inner_order_address.nil?
      @inner_order_address = InnerOrderAddress.new(params[:inner_order_address])
      @inner_order_address.user_id = user_id
      @inner_order_address.save
    else
      @inner_order_address.update_attributes(params[:inner_order_address])
    end

    @back_order_skus = BackOrderSku.find_all_by_user_id(user_id)
  end

end