module Taurus
	module Index
		class OrdersController < BaseController
      before_filter :authenticate_user!
      helper "taurus/orders"

			def new
        session[:order_step] = nil
        session[:order_params] ||= {}
        @order = Order.new
        @order.order_delivery = OrderDelivery.new
        @order.order_payment = OrderPayment.new
			end

			def create
        session[:order_params].deep_merge!(params[:order]) if params[:order]
        @cart = current_cart
        @order = Order.new(session[:order_params])
        @order.user_id = current_user.id
        @order.customer_name = current_user.taurus_userable.name  
        @order.total_payment = @cart.total_price
        @cart.cart_product_line_items.each do |line_item|
          @order.order_product_line_items << OrderProductLineItem.new(
            :product_id => line_item.product_id, :product_amount => line_item.product_amount, 
            :unit_price => line_item.product.price_after_tax
          )
        end
        @order.current_step = session[:order_step]
        if @order.valid?  
          if params[:back_button]  
            @order.current_step = "new"  
          elsif params[:commit_button]  
            @order.save  
          elsif params[:preview_button]  
            @order.current_step = "preview"  
          end  
          session[:order_step] = @order.current_step  
        end  
        if @order.new_record?  
          render 'new'  
        else  
          @cart.destroy
          session[:order_step] = session[:order_params] = session[:cart_id] = nil  
          redirect_to index_home_index_url  
        end
			end

		end
	end
end