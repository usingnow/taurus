class Sku < ActiveRecord::Base
  has_many :order_details
  has_many :sku_images
  belongs_to :brand
  attr_accessor :brand_name, :sku_category_name
  validates :number, :name, :brand_id, :brand_name, :sku_category_id, :sku_category_name, :unit, :specification,
            :delivery_day, :sku_type, :can_return, :can_on_be_half, :presence => true
  validates_uniqueness_of :number
end
