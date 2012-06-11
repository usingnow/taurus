#encoding:UTF-8
module Taurus
  class ProductCategory < ActiveRecord::Base
    attr_accessor :parent_name

    STATUS = { true => "激活", false => "未激活" }

  	has_many :custom_properties
  	has_many :skus
  	has_many :products
    belongs_to :parent, :class_name => "ProductCategory", :foreign_key => "parent_id"
    has_many :children, :class_name => "ProductCategory", :foreign_key => "parent_id"

    before_destroy :destroy_validate
    before_save :default_value
  	
    scope :tops, where(:parent_id => nil)

    def self.seconds(params_id)
    	where(:parent_id => params_id)
    end

  	validates_presence_of :name, :number
  	validates_uniqueness_of :number

    def custom_property?
      custom_properties.size > 0 ? true : false
    end

    protected
    def destroy_validate
      [:children, :skus, :products, :custom_properties].map do |relation|
        return false if self.send(relation).size > 0
      end   
    end  

    def default_value
      self.parent_id = nil if parent_name.blank?
    end
  end
end