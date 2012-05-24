#encoding:UTF-8
module Taurus
	class StoreSkuLineItem < ActiveRecord::Base
		belongs_to :store
		belongs_to :sku

    validates_uniqueness_of :sku_id
    validates_numericality_of :reserved, :in_stock, :only_integer => true, :greater_than => -1

		# 判断可销售数量是否足够 返回boolean
    # Examples
    #
    #   attributes = [{:sku_id => 1, :sku_amount => 5},{:sku_id => 3, :sku_amount => 2}]
    #   StoreSkuLineItem.available(attributes) 
    #
    #   StoreSkuLineItem.available(:sku_id => 1, :sku_amount => 2) 
    # 
		def self.available?(attributes = nil)
			result = true
      if attributes.is_a?(Array)
        attributes.each do |attribute|
          result = StoreSkuLineItem.find_by_sku_id(attribute[:sku_id]).available > attribute[:sku_amount]
        	break unless result
        end
      else
      	result = StoreSkuLineItem.find_by_sku_id(attributes[:sku_id]).available > attributes[:sku_amount]
      end
      result
		end

    def available?(sku_amount)
      available > sku_amount
    end

		def out_of_stock
      (in_stock - reserved) < 0 ? (in_stock - reserved) * -1 : 0
		end

		def available
      (in_stock - reserved) < 0 ? 0 : (in_stock - reserved)
		end

	end
end