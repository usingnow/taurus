class Sku < ActiveRecord::Base
  has_many :order_details
  validates :number, :name, :brand_id, :sku_category_id, :unit, :specification, :delivery_day, :presence => true
end
