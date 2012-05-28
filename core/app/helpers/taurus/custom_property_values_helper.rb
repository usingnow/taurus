#encoding:UTF-8
module Taurus
	module CustomPropertyValuesHelper
		def custom_property_values(f, disabled = false)
			inputs = ''
			@product.product_category.custom_properties.actived.each do |property|
				property_value = @product.custom_property_values.find_by_product_id_and_custom_property_id(@product.id,property.id)
	    	inputs += content_tag :div, :class => "control-group #{property.input_type} optional" do
	    		input = content_tag :label, :class => "#{property.input_type} optional control-label" do
            property.name
	    		end
	    		input += content_tag :div, :class => "controls" do
	    			case property.property_type
			      when 0
			      	text_field_tag :"string_value[#{property.id}]", property_value ? property_value.string_value : nil,
			      	 :class => "string", :disabled => disabled
			      when 1
			        text_field_tag :"string_value[#{property.id}]", property_value ? property_value.string_value : 0, 
			        :class => "numeric integer optional", :step => 1, :type => "number", :disabled => disabled
			      when 2
			      	text_field_tag :"string_value[#{property.id}]", property_value ? property_value.string_value : 0,
			      	 :class => "numeric decimal optional", :step => "any", :type => "number", :disabled => disabled
			      when 3
			      	date_select(:custom_property_value, :"string_value[#{property.id}]", 
			      		{ :default => property_value ? property_value.string_value.to_date : Time.now }, { :class => "date optional", :disabled => disabled })
			      when 9
			      	text_area_tag :"text_value[#{property.id}]", property_value ? property_value.text_value : nil, 
			      	:class => "text optional", :disabled => disabled
			      end 
	    		end
	    		input
	    	end
	  	end
	  	inputs
	 	end
	end
end