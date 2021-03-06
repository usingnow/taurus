#encoding:UTF-8
module Taurus
	class DeliveryRecord < ActiveRecord::Base
    DELIVERY_RECORD_TYPE = {
     0 => "订单出库", 1 => "内部领用", 2 => "退换货", 3 => "损耗", 4 => "调货", 9 => "其他" 
    }
  	DELIVERY_TYPE = { 0 => "快递", 1 => "自配", 2 => "客户自提" }

		belongs_to :order
		accepts_nested_attributes_for :order
		belongs_to :administrator
		has_many :delivery_record_product_line_items, :dependent => :destroy
		has_many :products, :through => :delivery_record_product_line_items

		before_validation :default_value, :on => :create

		validates_presence_of :number, :delivery_record_type, :delivery_type, :administrator_id
		validates_uniqueness_of :number
		validates_presence_of :delivery_name, :delivery_date, :if => Proc.new{ delivery_type == 1 }
		validates_presence_of :courier, :courier_number, :delivery_date, :if => Proc.new{ delivery_type == 0 }
    validates_presence_of :customer_name, :customer_phone, :pick_up_date,
                          :if => Proc.new{ delivery_type == 2 }

    validate :available_stock?



		protected
		def default_value
      self.number = "D" + Array.new(9){rand(9)}.join
		end

		def available_stock?
      delivery_record_product_line_items.each do |line_item|
        unless line_item.product.stock.delivery?(line_item.product_amount)
          errors.add("$stock#{line_item.product.name}(#{line_item.product.number})", "库存不足")
        end
      end
    end
	end
end