module Taurus
  class ShippingCost < ActiveRecord::Base
    attr_accessible :cost, :remarks

    validates_presence_of :cost
    validates_numericality_of :cost, :greater_than_or_equal_to => 0

  end
end