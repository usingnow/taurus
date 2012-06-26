module Taurus
  class OrderProductLineItem < ActiveRecord::Base
  	belongs_to :order
  	belongs_to :product

  	validates_presence_of :product_id
  	
  	def subtotal
      unit_price * product_amount
  	end
  end
end