module Taurus
	module Index
		class OrdersController < BaseController
      before_filter :authenticate_user!

			def new
        @order = Order.new
        @order.order_delivery = OrderDelivery.new
			end
		end
	end
end