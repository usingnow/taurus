module Taurus
  class ProductCategory < ActiveRecord::Base
  	has_many :custom_properties, :dependent => :destroy
  	has_many :skus, :dependent => :destroy
  	has_many :products, :dependent => :destroy
  	
    scope :tops, where(:parent_id => nil)

    def self.seconds(params_id)
    	where(:parent_id => params_id)
    end

  	validates_presence_of :name, :number
  	validates_uniqueness_of :number
  end
end