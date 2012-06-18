#encoding:UTF-8
module Taurus
	class DeliveryRecordProductLineItem < ActiveRecord::Base
		belongs_to :delivery_record
		belongs_to :product

		after_create :order_delivery_deduct_stock
		
		validates_numericality_of :product_amount, :only_integer => true, :greater_than => 0

		protected
		# 订单出库减库存
    def order_delivery_deduct_stock
      product.stock.update_attributes(
        :reserved => product.stock.reserved - product_amount,
        :in_stock => product.stock.in_stock - product_amount
      )
    end
	end
end