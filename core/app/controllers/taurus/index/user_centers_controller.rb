module Taurus
	module Index
		class UserCentersController < BaseController
			before_filter :authenticate_user!
			helper "taurus/orders"

			def index
				@search = current_user.orders.search(params[:q])
				@orders = @search.result.paginate(:page => params[:page], :per_page => 20)
      end
		end
	end	
end