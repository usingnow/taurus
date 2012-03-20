class ProductCategory < ActiveRecord::Base
  scope :four, where("length(number) = 9")
  validates :parent_id, :number, :name, :presence => true
end
