module Taurus
	class CombinedProduct < ActiveRecord::Base
		attr_accessor :product_name
		
	  belongs_to :product
	  belongs_to :related, :class_name => "Product", :foreign_key => "related_id"

	  validates_uniqueness_of :related_id, :scope => :product_id
	end
end