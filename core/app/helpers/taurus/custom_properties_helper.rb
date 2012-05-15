module Taurus
	module CustomPropertiesHelper
		def format_property_type(type)
	    Taurus::CustomProperty::PROPERTY_TYPE[type]
	 	end
	end
end