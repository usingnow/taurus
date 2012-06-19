module Taurus
	module Admin
		class OrderDeliveryRecordsController < BaseController
			helper "taurus/orders"
      helper "taurus/delivery_records"

      def index
        @search = Order.available_deliveries.search(params[:q])
        @orders = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def new
        @order = Order.available_deliveries.find(params[:order_id])
        
        @delivery_record = DeliveryRecord.new
        @delivery_record.order_id = @order.id
      end

      def create
        @order = Order.available_deliveries.find(params[:delivery_record][:order_id])

        @delivery_record = DeliveryRecord.new(params[:delivery_record])
        @delivery_record.order_id = @order.id
        @delivery_record.delivery_record_type = 0
        @delivery_record.administrator_id = current_administrator.id

        @order.order_product_line_items.each do |line_item|
          @delivery_record.delivery_record_product_line_items << DeliveryRecordProductLineItem.new(
            :product_id => line_item.product_id,
            :product_amount => line_item.product_amount
          )
        end

        if @delivery_record.save
          @order.product_delivery
          redirect_to(admin_order_delivery_records_path)
        else
          render :action => :new
        end
      end

		end
	end
end