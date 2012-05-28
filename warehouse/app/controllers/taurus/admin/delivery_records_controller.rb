module Taurus
	module Admin
		class DeliveryRecordsController < BaseController
			helper "taurus/orders"
      helper "taurus/delivery_records"

      def index
        @search = DeliveryRecord.search(params[:q])
        @delivery_records = @search.result.paginate(:page => params[:page], :per_page => 20)
      end
      
		end
	end
end