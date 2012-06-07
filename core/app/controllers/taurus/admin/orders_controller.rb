module Taurus
	module Admin
		class OrdersController < BaseController
			helper "taurus/orders"

		  def index
		  	@search = Order.search(params[:q])
		  	@search.sorts = "updated_at desc"
		  	@orders = @search.result.processing.paginate(:page => params[:page], :per_page => 20)
		  end

		  def all
        @search = Order.search(params[:q])
		  	@search.sorts = "updated_at desc"
		  	@orders = @search.result.paginate(:page => params[:page], :per_page => 20)
		  end

		  def show
        @order = Order.find(params[:id])
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
