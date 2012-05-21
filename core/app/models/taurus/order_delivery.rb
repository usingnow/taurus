module Taurus
  class OrderDelivery < ActiveRecord::Base
  	belongs_to :order
  	belongs_to :district

  	validates_presence_of :order_id, :district_id, :attention, :address
  end
end