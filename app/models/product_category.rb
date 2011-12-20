class ProductCategory < ActiveRecord::Base
  validates :parent_id, :number, :name, :presence => true
end
