#encoding:UTF-8
class PromotionByProduct < ActiveRecord::Base
  has_one :online_promotion, :as => :online_promotionable, :dependent => :destroy
  accepts_nested_attributes_for :online_promotion

  PRODUCTS_SELECTION = { 0 => "全部商品", 1 => "分类商品", 2 => "品牌商品", 3 => "指定商品" }
  PROMOTION_BASIS = { 0 => "购买数量大于", 1 => "多件优惠" }

  validates_numericality_of :product_discount, :greater_than => 0, :less_than_or_equal_to => 1
end
