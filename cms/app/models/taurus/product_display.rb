#encoding:UTF-8
module Taurus
  class ProductDisplay < ActiveRecord::Base
    attr_accessor :product_name
    belongs_to :product
    
    validates_presence_of :product_id, :product_name

    def product_name
      product ? product.name : ""
    end
  end
end
