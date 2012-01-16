class Sku < ActiveRecord::Base
  has_many :sku_images
  belongs_to :brand
  has_many :sku_productships
  has_many :products, :through => :sku_productships

  attr_accessor :brand_name, :sku_category_name
  validates :number, :name, :brand_id, :brand_name, :sku_category_id, :sku_category_name, :unit, :specification,
            :delivery_day, :sku_type,  :presence => true
  validates_uniqueness_of :number

  def nb_is_inventory
    flag = true
    products.each do |product|
      unless product.nb_is_inventory
        flag = false
        break
      end
    end
    flag
  end
end
