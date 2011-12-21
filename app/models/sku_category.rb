class SkuCategory < ActiveRecord::Base
  validates :root_id, :parent_id, :number, :name, :presence => true
end
