#encoding:UTF-8
class PromotionPriority < ActiveRecord::Base
  belongs_to :high, :class_name => "OnlinePromotion", :foreign_key => "promotion_high"
  belongs_to :low, :class_name => "OnlinePromotion", :foreign_key => "promotion_low"

  validates_presence_of :promotion_high, :promotion_low
  validate :priorities_empty?

  protected
    def priorities_empty?
      count = PromotionPriority.count(:conditions => "(promotion_high = #{promotion_high} and promotion_low = #{promotion_low})
                                                      or (promotion_high = #{promotion_low} and promotion_low = #{promotion_high})")
      errors.add(:promotion_high,"已存在") if count > 0
    end
end
