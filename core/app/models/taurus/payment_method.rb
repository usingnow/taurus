module Taurus
  class PaymentMethod < ActiveRecord::Base
  	has_many :order_payments, :dependent => :destroy

  	validates_presence_of :name
  end
end