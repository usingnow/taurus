module Taurus
  class OrderPayment < ActiveRecord::Base
  	belongs_to :order
  	belongs_to :payment_method

  	validates_presence_of :order_id, :payment_method_id
  	
  end
end