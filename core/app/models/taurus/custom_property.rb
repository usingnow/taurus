#encoding:UTF-8
module Taurus
	class CustomProperty < ActiveRecord::Base
		belongs_to :product_category
		scope :actived, where(:status => true)

		PROPERTY_TYPE = { 0 => "文本", 1 => "整数", 2 => "2位小数", 3 => "日期", 9 => "长文本" }

		def input_type
      case property_type
      when 0
      	"string"
      when 1
        "integer"
      when 2
        "decimal"
      when 3
        "date"
      when 9
        "text"
      end     
		end

		validates_presence_of :product_category_id, :name, :property_type
	end
end