module Taurus
	module Index
		class UserCentersController < Taurus::Index::BaseController
			before_filter :authenticate_user!
			helper "taurus/orders"

			def index
				@search = current_user.orders.search(params[:q])
				@search.sorts = "updated_at desc"
				@orders = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def online_payment

      end
		end
	end	
end