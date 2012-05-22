module Taurus
	module Admin
		class OrdersController < BaseController
		  def index
		  	@search = Order.search(params[:q])
		  	@orders = @search.result.paginate(:page => params[:page], :per_page => 20)
		  end
		end
	end	
end		
