class Product < ActiveRecord::Base
  belongs_to :brand

  validates :product_id, :name, :brand_id, :product_category_id, :unit, :specification, :delivery_days, :supplier_id, :presence => true

end
