module Taurus
	module Admin
		class OrderDeliveriesController < BaseController
			helper "taurus/orders"

		  def index
		  	@order = Order.find(params[:order_id])
		  	@order_delivery = @order.order_delivery
		  end

		end
	end	
end		
