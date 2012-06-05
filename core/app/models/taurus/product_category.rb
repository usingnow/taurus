module Taurus
  class ProductCategory < ActiveRecord::Base
    attr_accessor :parent_name

  	has_many :custom_properties, :dependent => :destroy
  	has_many :skus, :dependent => :destroy
  	has_many :products, :dependent => :destroy
    belongs_to :parent, :class_name => "ProductCategory", :foreign_key => "parent_id"
    has_many :children, :class_name => "ProductCategory", :foreign_key => "parent_id"
  	
    scope :tops, where(:parent_id => nil)

    def self.seconds(params_id)
    	where(:parent_id => params_id)
    end

  	validates_presence_of :name, :number
  	validates_uniqueness_of :number

    def custom_property?
      custom_properties.size > 0 ? true : false
    end
  end
end