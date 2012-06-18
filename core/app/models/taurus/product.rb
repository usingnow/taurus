#encoding:UTF-8
module Taurus
  class Product < ActiveRecord::Base
    SALES_STATUS = { true => "销售中", false => "非销售" }
    SHOWN_STATUS = { true => "上架", false => "下架" }

  	belongs_to :product_category
  	has_many :custom_property_values, :dependent => :destroy
  	has_many :product_images, :dependent => :destroy
    has_one :stock
    has_many :cart_product_line_items, :dependent => :destroy
    has_many :product_displays
    
    scope :shown, where("if_shown_on_web = 1")
    scope :selling, where("if_shown_on_web = 1 and sales_status = 1")
    scope :displays, joins(:product_displays).order("taurus_product_displays.sequence DESC")

  	attr_accessor :product_category_name, :current_step

  	def product_category_name
  		product_category ? product_category.name : nil
  	end

  	validates_presence_of :number, :name, :product_category_name, :product_category_id, :weight, :price_after_tax
    validates_uniqueness_of :number
    validate :must_have_image, :if => Proc.new { current_step == "sales_status" }

    def main_image(style = :small)
      product_images.main.last.image.url(style)
    end

    protected
    def must_have_image
      if if_shown_on_web
        errors.add(:if_shown_on_web, :must_have_image) if product_images.size == 0
      end 
    end
  end
end