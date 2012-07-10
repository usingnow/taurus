#encoding:UTF-8
module Taurus
  class Product < ActiveRecord::Base
    attr_accessor :product_category_name, :current_step

    SALES_STATUS = { true => "销售中", false => "非销售" }
    SHOWN_STATUS = { true => "上架", false => "下架" }
    PRODUCT_TYPE = { 0 => "销售单品", 1 => "组合商品" } 

  	belongs_to :product_category
  	has_many :custom_property_values, :dependent => :destroy
  	has_many :product_images, :dependent => :destroy
    has_many :combined_products, :dependent => :destroy
    has_one :stock, :dependent => :destroy
    has_many :cart_product_line_items, :dependent => :destroy
    has_many :product_displays, :dependent => :destroy

    after_create :add_to_store, :if => Proc.new { product_type == 0 }


    validates_presence_of :number, :name, :product_category_name, :product_category_id, :weight, :price_after_tax
    validates_uniqueness_of :number
    validate :must_contain_two_product, :if => Proc.new { current_step == "sales_status" && product_type == 1 }

    
    scope :shown, where("if_shown_on_web = 1")
    scope :selling, where("sales_status = 1")
    scope :displays, joins(:product_displays).order("taurus_product_displays.sequence DESC")
    scope :combined, where("product_type = 1")
    scope :single, where("product_type = 0")


  	def product_category_name
  		product_category ? product_category.name : nil
  	end

    def main_image(style = :small)
      product_images.main.last.image.url(style)
    end

    def main_logo
      main_image(:logo)
    end

    def available?
      result = true

      if product_type == 0
        result = stock.in_stock > stock.reserved
      else
        combined_products.each do |combined_product|
          if combined_product.related.stock.in_stock <= combined_product.related.stock.reserved
            result = false
            break
          end
        end
      end 
      
      result 
    end

    protected
    def must_contain_two_product
      if sales_status
        if combined_products.to_a.sum { |combined_product| combined_product.amount } < 2
          errors.add(:sales_status, :must_contain_two_product) 
        end
      end
    end

    def add_to_store
      Stock.create(:product_id => self.id)
    end
  end
end