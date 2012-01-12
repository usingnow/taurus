class Sku < ActiveRecord::Base
  has_many :order_details
  has_many :sku_images
  belongs_to :brand
  validates :number, :name, :brand_id, :sku_category_id, :unit, :specification, :delivery_day, :presence => true
end
