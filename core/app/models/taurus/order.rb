module Taurus
  class Order < ActiveRecord::Base
  	has_one :order_payment, :dependent => :destroy

  	has_one :order_delivery, :dependent => :destroy
  	accepts_nested_attributes_for :order_delivery
  	has_many :order_product_line_items, :dependent => :destroy


  	validates_presence_of :user_id, :customer_name, :order_status, :total_payment
  	
  end
end