#encoding:UTF-8
module Taurus
	class DeliveryRecordSkuLineItem < ActiveRecord::Base
		belongs_to :delivery_record
		belongs_to :sku

		after_create :order_delivery_deduct_stock
		
		validates_numericality_of :sku_amount, :only_integer => true, :greater_than => 0

		protected
		# 订单出库减库存
    def order_delivery_deduct_stock
      sku.store_sku_line_item.update_attributes(
        :reserved => sku.store_sku_line_item.reserved - sku_amount,
        :in_stock => sku.store_sku_line_item.in_stock - sku_amount
      )
    end
	end
end