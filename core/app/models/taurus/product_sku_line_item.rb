module Taurus
  class ProductSkuLineItem < ActiveRecord::Base
  	belongs_to :product
  	belongs_to :sku

  	attr_accessor :sku_name

  	validates_presence_of :product_id, :sku_id, :sku_amount
  	validates_numericality_of :sku_amount, :only_integer => true, :greater_than => 0

  end	
end