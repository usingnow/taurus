#encoding:UTF-8
module Taurus
	class StoreSkuLineItem < ActiveRecord::Base
		belongs_to :store
		belongs_to :sku

		def out_of_stock
      (in_stock - reserved) < 0 ? (in_stock - reserved) * -1 : 0
		end

		def available
      (in_stock - reserved) < 0 ? 0 : (in_stock - reserved)
		end
	end
end