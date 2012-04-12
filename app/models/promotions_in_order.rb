#encoding:UTF-8
class PromotionsInOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :online_promotion



#  validates_presence_of :order_id, :online_promotion_id

end
