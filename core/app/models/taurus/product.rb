#encoding:UTF-8
module Taurus
  class Product < ActiveRecord::Base
  	belongs_to :product_category
  	has_many :custom_property_values
  	has_many :product_sku_line_items
  	has_many :product_images

  	attr_accessor :product_category_name, :current_step

  	def product_category_name
  		product_category ? product_category.name : nil
  	end

  	validates_presence_of :number, :name, :product_category_name, :product_category_id, :weight, :price_after_tax
  
    validate :greater_than_now, :less_than_now, :must_have_sku,
             :if => Proc.new { current_step == "sales_status" }

    protected
    def greater_than_now
      errors.add(:sales_starts_at, "开始销售时间必须大于当前时间") if sales_starts_at.to_i < Time.now.to_i
    end

    def less_than_now
      errors.add(:sales_ends_at, "结束销售时间必须大于开始销售时间") if sales_starts_at.to_i > sales_ends_at.to_i
    end

    def must_have_sku
      if sales_status
       errors.add(:sales_status, "最少包含一个SKU") if product_sku_line_items.size == 0
      end 
      if if_shown_on_web
      	errors.add(:if_shown_on_web, "最少包含一个SKU") if product_sku_line_items.size == 0
      end	
    end
  end
end