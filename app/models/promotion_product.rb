class PromotionProduct < ActiveRecord::Base
  belongs_to :online_promotion
  belongs_to :brand, :class_name => "Brand", :foreign_key => "selection_parameter"
  belongs_to :sku_category, :class_name => "SkuCategory", :foreign_key => "selection_parameter"
  belongs_to :sku, :class_name => "Sku", :foreign_key => "selection_parameter"

  validates_presence_of :online_promotion_id, :product_info
  validate :product_info_empty?

  protected
    def product_info_empty?
      ids = PromotionProduct.find_all_by_online_promotion_id_and_product_info(online_promotion_id,product_info).map(&:product_info)
      if ids.member?(product_info.to_i)
        errors.add(:product_info, "已存在")
      end
    end
end
