#encoding:UTF-8
module Taurus
	class CustomPropertyValue < ActiveRecord::Base
		belongs_to :product
		belongs_to :custom_property
		
	end
end