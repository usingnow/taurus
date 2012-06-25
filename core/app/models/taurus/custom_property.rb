#encoding:UTF-8
module Taurus
	class CustomProperty < ActiveRecord::Base
    PROPERTY_TYPE = { 0 => "文本", 1 => "整数", 2 => "2位小数", 3 => "日期", 9 => "长文本" }

		belongs_to :product_category
    has_many :custom_property_values
    has_many :products, :through => :custom_property_values

    before_destroy :destroy_validate   

    validates_presence_of :product_category_id, :name, :property_type

    scope :actived, where(:status => true)

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

    protected
    def destroy_validate
      [:products].map do |relation|
        if self.send(relation).size > 0
          errors.add(relation, '')
        end
      end
      return false if errors.any?   
    end  

	end
end