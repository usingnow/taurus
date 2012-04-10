#encoding:UTF-8
class PromotionByProduct < ActiveRecord::Base
  has_one :online_promotion, :as => :online_promotionable, :dependent => :destroy
  accepts_nested_attributes_for :online_promotion

  PRODUCTS_SELECTION = { 0 => "全部商品", 1 => "分类商品", 2 => "品牌商品", 3 => "指定商品" }
  PROMOTION_BASIS = { 0 => "购买数量大于", 1 => "多件优惠" }

  validates_numericality_of :product_discount, :greater_than => 0, :less_than_or_equal_to => 1
  validates_numericality_of :basis_parameter, :only_integer => true, :greater_than_or_equal_to => 0
  validate :product_exists?

  protected
    def product_exists?
      unless products_selection == 0
        if online_promotion.current_step == "preview"
          count = PromotionProductTemp.count(:conditions => "administrator_id = #{online_promotion.administrator_id} and products_selection = #{products_selection}")
          if count == 0
            errors.add(:products_selection,"不能为空")
          end
        elsif online_promotion.current_step == "save"
          count = online_promotion.promotion_products.count
          if count == 0
            errors.add(:products_selection,"不能为空")
          end
        end
      end
    end
end
