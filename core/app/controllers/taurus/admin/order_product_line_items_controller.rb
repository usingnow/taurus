module Taurus
	module Admin
		class OrderProductLineItemsController < BaseController
			helper "taurus/orders"

		  def index
		  	@order = Order.find(params[:order_id])
		  end

		end
	end	
end		