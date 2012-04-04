#encoding:UTF-8
class PromotionByOrder < ActiveRecord::Base
  has_one :online_promotion, :as => :online_promotionable, :dependent => :destroy
  accepts_nested_attributes_for :online_promotion
  has_many :promotion_members

  FREE_DELIVERY = { false => "否", true => "是" }

end
