#encoding:UTF-8
module Taurus
	class ReplenishmentRecordSkuLineItem < ActiveRecord::Base
		belongs_to :replenishment_record
		belongs_to :sku

		after_create :increase_stock
		
		validates_numericality_of :sku_amount, :only_integer => true, :greater_than => 0

		protected
		def increase_stock
      sku.store_sku_line_item.update_attributes(
        :in_stock => sku.store_sku_line_item.in_stock + sku_amount
      )
		end
	end
end