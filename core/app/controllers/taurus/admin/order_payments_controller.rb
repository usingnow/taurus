module Taurus
	module Admin
		class OrderPaymentsController < BaseController
			helper "taurus/orders"

		  def index
		  	@order = Order.find(params[:order_id])
		  	@order_payment = @order.order_payment
		  end

		end
	end	
end		
