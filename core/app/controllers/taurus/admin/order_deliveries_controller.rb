module Taurus
	module Admin
		class OrderDeliveriesController < BaseController
			helper "taurus/orders"

		  def index
		  	@order = Order.find(params[:order_id])
		  	@order_delivery = @order.order_delivery
		  end

		  def edit
        @order = Order.find(params[:order_id])
        @order_delivery = @order.order_delivery
		  end

		  def update
        @order = Order.find(params[:order_id])
        @order_delivery = @order.order_delivery

        if @order_delivery.update_attributes(params[:order_delivery])
        	flash[:success] = I18n.t('successfully_updated')
        	redirect_to(edit_admin_order_order_delivery_url(@order, @order_delivery))
        else
          render :action => :edit  
        end
		  end

		end
	end	
end		
