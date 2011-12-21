class Sku < ActiveRecord::Base
  validates :number, :name, :brand_id, :sku_category_id, :unit, :specification, :delivery_day, :presence => true
end
