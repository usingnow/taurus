#encoding:UTF-8
module Taurus
	class ReplenishmentRecordProductLineItem < ActiveRecord::Base
		belongs_to :replenishment_record
		belongs_to :product

		after_create :increase_stock
		
		validates_numericality_of :product_amount, :only_integer => true, :greater_than => 0

		protected
		def increase_stock
      product.stock.update_attributes(
        :in_stock => product.stock.in_stock + product_amount
      )
		end
	end
end