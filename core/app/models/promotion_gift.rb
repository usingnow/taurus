class PromotionGift < ActiveRecord::Base
  belongs_to :order
  belongs_to :sku

#  validates_presence_of :order_id, :sku_id
end
