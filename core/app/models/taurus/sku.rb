#encoding:UTF-8
module Taurus
  class Sku < ActiveRecord::Base
    STATUS = { true => "激活", false => "未激活" }

    belongs_to :product_category
  	belongs_to :brand
  	belongs_to :supplier
    has_one :store_sku_line_item
    has_many :product_sku_line_items
    has_many :products, :through => :product_sku_line_items

    before_validation :default_value
    after_create :add_to_store


    attr_accessor :product_category_name, :brand_chinese_name, :supplier_name

    def product_category_name
      product_category ? product_category.name : nil
    end

    def brand_chinese_name
      brand ? brand.chinese_name : nil
    end	

    def supplier_name
    	supplier ? supplier.name : nil
    end

  	validates_presence_of :number, :name, :product_category_name, :product_category_id, 
  												:brand_chinese_name, :brand_id, :supplier_name, :supplier_id, :weight
  	validates_numericality_of :weight, :cost_before_tax, :cost_after_tax, :delivery_days		
  	validates_uniqueness_of :number		

    protected
    def add_to_store
      StoreSkuLineItem.create(:store_id => 1, :sku_id => self.id)
    end

    def default_value
      self.number = "SKU" + Array.new(9) { rand(9) }.join
    end							
  end
end