module Taurus
	module Admin
		class DeliveryRecordsController < BaseController
			helper "taurus/orders"
      helper "taurus/delivery_records"

      def index
        @search = DeliveryRecord.search(params[:q])
        @search.sorts = "created_at DESC"
        @delivery_records = @search.result(:distinct => true).paginate(:page => params[:page], :per_page => 20)
      end

      def show 
        @delivery_record = DeliveryRecord.find(params[:id])
      end
      
		end
	end
end