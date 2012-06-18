#encoding:UTF-8
module Taurus
	class Stock < ActiveRecord::Base
		belongs_to :product

    validates_uniqueness_of :product_id
    validates_numericality_of :reserved, :in_stock, :only_integer => true, :greater_than => -1

		# 判断可销售数量是否足够 返回boolean
    # Examples
    #
    #   attributes = [{:product_id => 1, :product_amount => 5},{:product_id => 3, :product_amount => 2}]
    #   Stock.available(attributes) 
    #
    #   Stock.available(:product_id => 1, :product_amount => 2) 
    # 
		def self.available?(attributes = nil)
			result = true
      if attributes.is_a?(Array)
        attributes.each do |attribute|
          result = Stock.find_by_product_id(attribute[:product_id]).available > attribute[:product_amount]
        	break unless result
        end
      else
      	result = Stock.find_by_sku_id(attributes[:product_id]).available > attributes[:product_amount]
      end
      result
		end

    def available?(product_amount)
      available > product_amount
    end

		def out_of_stock
      (in_stock - reserved) < 0 ? (in_stock - reserved) * -1 : 0
		end

		def available
      (in_stock - reserved) < 0 ? 0 : (in_stock - reserved)
		end

	end
end