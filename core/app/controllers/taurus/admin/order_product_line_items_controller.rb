module Taurus
	module Admin
		class OrderProductLineItemsController < BaseController

		  def index
		  	@order = Order.find(params[:order_id])
		  end

		end
	end	
end		