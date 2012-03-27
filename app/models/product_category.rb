class ProductCategory < ActiveRecord::Base
  belongs_to :parent, :class_name => "ProductCategory", :foreign_key => "parent_id"
  scope :four, where("length(number) = 9")
  validates :parent_id, :number, :name, :presence => true
end
