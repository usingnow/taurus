module Taurus
  class OrderDelivery < ActiveRecord::Base
  	belongs_to :order, :dependent => :destroy
  	belongs_to :district

  	validates_presence_of :district_id, :attention, :address
  end
end