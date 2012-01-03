#encoding:UTF-8
class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :product_storeships

  validates :product_id, :name, :brand_id, :product_category_id, :unit, :specification, :delivery_days, :supplier_id, :presence => true

  validate :brand_exists?, :category_exists?, :supplier_exists?

  protected

    def brand_exists?
      ids = Brand.all.map(&:id)
      if !brand_id.blank? && !ids.member?(brand_id.to_i)
        errors.add(:brand_id, "不存在")
      end
    end

    def category_exists?
      ids = ProductCategory.all.map(&:id)
      if !product_category_id.blank? && !ids.member?(product_category_id.to_i)
        errors.add(:product_category_id, "不存在")
      end
    end

    def supplier_exists?
      ids = Supplier.all.map(&:id)
      if !supplier_id.blank? && !ids.member?(supplier_id.to_i)
        errors.add(:supplier_id, "不存在")
      end
    end
end


