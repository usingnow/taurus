module Taurus
  class CartProductLineItem < ActiveRecord::Base
  	belongs_to :cart
  	belongs_to :product
  	
  	validates_presence_of :cart_id, :product_id
  	validates_numericality_of :product_amount, :only_integer => true, :greater_than => 0
  end
end