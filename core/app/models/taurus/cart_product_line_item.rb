module Taurus
  class CartProductLineItem < ActiveRecord::Base
  	belongs_to :cart
  	belongs_to :product


  	def subtotal
      product_amount*product.price_after_tax
  	end
  	
  	validates_presence_of :cart_id, :product_id
  	validates_numericality_of :product_amount, :only_integer => true, :greater_than => 0
  end
end