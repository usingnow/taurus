module Taurus
  class ProductCategory < ActiveRecord::Base
  	validates_presence_of :name, :number
  	validates_uniqueness_of :number
  end
end