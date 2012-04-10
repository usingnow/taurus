#encoding:UTF-8
class PromotionByOrder < ActiveRecord::Base
  has_one :online_promotion, :as => :online_promotionable, :dependent => :destroy
  accepts_nested_attributes_for :online_promotion

  FREE_DELIVERY = { false => "否", true => "是" }

  validates_numericality_of :order_payment_over, :purchase_amount_limit, :greater_than_or_equal_to => 0
  validates_numericality_of :discount, :greater_than => 0, :less_than_or_equal_to => 1

end
