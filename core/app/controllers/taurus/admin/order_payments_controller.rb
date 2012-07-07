module Taurus
	module Admin
		class OrderPaymentsController < BaseController
			helper "taurus/orders"

		  def index
		  	@order = Order.find(params[:order_id])
		  	@order_payment = @order.order_payment
		  end

		  def edit
        @order = Order.find(params[:order_id])
		  	@order_payment = @order.order_payment
		  end

		  def update
        @order = Order.find(params[:order_id])
		  	@order_payment = @order.order_payment

		  	if @order_payment.update_attributes(params[:order_payment])
        	flash[:success] = I18n.t('successfully_updated')
        	redirect_to(edit_admin_order_order_payment_url(@order, @order_payment))
        else
          render :action => :edit  
        end
		  end

		end
	end	
end		
