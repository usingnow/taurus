#encoding:UTF-8
module Taurus
	class DeliveryRecord < ActiveRecord::Base
    DELIVERY_RECORD_TYPE = {
     0 => "订单出库", 1 => "内部领用", 2 => "退换货", 3 => "损耗", 4 => "调货", 9 => "其他" 
    }
  	DELIVERY_TYPE = { 0 => "快递", 1 => "自配", 2 => "客户自提" }

		belongs_to :order
		belongs_to :store
		belongs_to :administrator
		has_many :delivery_record_sku_line_items, :dependent => :destroy

		before_validation :default_value, :on => :create

		validates_presence_of :number, :store_id, :delivery_record_type, :delivery_type, :administrator_id
		validates_uniqueness_of :number
		validates_presence_of :delivery_name, :delivery_date, :if => Proc.new{ delivery_type == 1 }
		validates_presence_of :courier, :courier_number, :delivery_date, :if => Proc.new{ delivery_type == 0 }
    validates_presence_of :customer_name, :customer_phone, :pick_up_date,
                          :if => Proc.new{ delivery_type == 2 }

    validate :available_stock?



		protected
		def default_value
      self.number = "D" + Array.new(9){rand(9)}.join
      self.store_id = 1
		end

		def available_stock?
      delivery_record_sku_line_items.each do |line_item|
        unless line_item.sku.store_sku_line_item.available?(line_item.sku_amount)
          errors.add("$stock#{line_item.sku.name}(#{line_item.sku.number})", "库存不足")
        end
      end
    end
	end
end