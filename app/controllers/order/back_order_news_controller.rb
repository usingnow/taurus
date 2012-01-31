class Order::BackOrderNewsController < ApplicationController
  def new
    @user = User.find params[:user_id]
    BackOrderSku.destroy_all(:user_id => params[:user_id])
    @search = Sku.search(params[:q])
    @procedures = Procedure.user_procedures params[:user_id]
    @back_order_skus = Array.new
    @inner_order_address = InnerOrderAddress.new
  end

  def preview
    @user = User.find params[:user_id]

    @inner_order_payment = InnerOrderPayment.new(params[:inner_order_payment])
    @inner_order_payment.user_id = @user.id
    @inner_order_address = InnerOrderAddress.new(params[:inner_order_address])
    @inner_order_address.user_id = @user.id

    unless [@inner_order_payment, @inner_order_address].map(&:valid?).include?(false)
      inner_order_payment = InnerOrderPayment.find_by_user_id(@user.id)
      if inner_order_payment.nil?
        @inner_order_payment.save
      else
        inner_order_payment.update_attributes(params[:inner_order_payment])
      end

      inner_order_address = InnerOrderAddress.find_by_user_id(@user.id)
      if inner_order_address.nil?
        @inner_order_address.save
      else
        inner_order_address.update_attributes(params[:inner_order_address])
      end

      @back_order_skus = BackOrderSku.find_all_by_user_id(@user.id)
      @inner_order_payment = InnerOrderPayment.find_by_user_id(@user.id)
      @inner_order_address = InnerOrderAddress.find_by_user_id(@user.id)
      if @inner_order_address.district.city_no == 330200
        if @back_order_skus.to_a.sum{ |sku| sku.subtotal } > 50
          @carriage_cost = 0
        else
          @carriage_cost = 5
        end
      else
        if @back_order_skus.to_a.sum{ |sku| sku.subtotal } > 200
          @carriage_cost = 0
        else
          @carriage_cost = 20
        end
      end
    else
      @search = Sku.search(params[:q])
      @procedures = Procedure.user_procedures @user.id
      @back_order_skus = BackOrderSku.find_all_by_user_id(@user.id)
      render :action => "new"
    end
  end
end
