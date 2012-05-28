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
        @line_items = order_sku_line_items(@order)
        
        @delivery_record = DeliveryRecord.new
        @delivery_record.order_id = @order.id
      end

      def create
        @order = Order.available_deliveries.find(params[:delivery_record][:order_id])
        @line_items = order_sku_line_items(@order)

        @delivery_record = DeliveryRecord.new(params[:delivery_record])
        @delivery_record.order_id = @order.id
        @delivery_record.delivery_record_type = 0
        @delivery_record.administrator_id = current_administrator.id

        @line_items.each do |line_item|
          @delivery_record.delivery_record_sku_line_items << DeliveryRecordSkuLineItem.new(
            :sku_id => line_item.sku_id,
            :sku_amount => line_item.sku_amount
          )
        end

        if @delivery_record.save
          @order.product_delivery
          redirect_to(admin_order_delivery_records_path)
        else
          render :action => :new
        end
      end

      protected
      def order_sku_line_items(order)
        array = Array.new
        order.order_product_line_items.each do |product_line_item|
          product_line_item.product.product_sku_line_items.each do |sku_line_item|
            line_item = array.find { |item| item.sku_id == sku_line_item.sku_id }
            if line_item
              line_item.sku_amount += sku_line_item.sku_amount*product_line_item.product_amount
            else
              array << DeliveryRecordSkuLineItem.new(
                :sku_id => sku_line_item.sku_id,
                :sku_amount => sku_line_item.sku_amount*product_line_item.product_amount
              )
            end
          end
        end
        array
      end
		end
	end
end