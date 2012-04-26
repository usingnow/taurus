class SkuProductship < ActiveRecord::Base
  belongs_to :product

  validates :sku_id, :product_id, :presence => true
  validates_numericality_of :package_num, :only_integer => true, :greater_than => 0
end
