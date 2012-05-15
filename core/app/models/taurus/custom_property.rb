#encoding:UTF-8
module Taurus
	class CustomProperty < ActiveRecord::Base
		belongs_to :product_category
		PROPERTY_TYPE = { 0 => "文本", 1 => "整数", 2 => "2位小数", 3 => "长文本" }

		validates_presence_of :product_category_id, :name, :property_type
	end
end