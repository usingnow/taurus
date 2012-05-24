#encoding:UTF-8
module Taurus
	class DeliveryRecordSkuLineItem < ActiveRecord::Base
		belongs_to :delivery_record
		belongs_to :sku
		
		validates_numericality_of :sku_amount, :only_integer => true, :greater_than => 0
	end
end