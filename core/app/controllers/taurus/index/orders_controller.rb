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
        @order = Order.new(session[:order_params])
        @order.user_id = current_user.id
        @order.customer_name = current_user.taurus_userable.name  
        @order.current_step = session[:order_step]
        if @order.valid?  
          if params[:back_button]  
            @order.previous_step  
          elsif params[:commit_order]  
            @order.save  
          else  
            @order.next_step  
          end  
          session[:order_step] = @order.current_step  
        end  
        if @order.new_record?  
          render 'new'  
        else  
          session[:order_step] = session[:order_params] = nil  
          redirect_to index_home_index_url  
        end
			end

		end
	end
end