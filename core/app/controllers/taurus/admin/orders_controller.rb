module Taurus
	module Admin
		class OrdersController < BaseController
			helper "taurus/orders"
		  def index
		  	@search = Order.search(params[:q])
		  	@orders = @search.result.paginate(:page => params[:page], :per_page => 20)
		  end

		  def relieve_reserved
        @order = Order.find(params[:id])
        @order.relieve_reserved
        redirect_to(:back)
		  end

		  def confirm_online_payment
        @order = Order.find(params[:id])
        @order.confirm_online_payment
        redirect_to(:back)
		  end
		end
	end	
end		
