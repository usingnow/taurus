class SkuProductship < ActiveRecord::Base
  belongs_to :product

  validates :sku_id, :product_id, :presence => true
end
