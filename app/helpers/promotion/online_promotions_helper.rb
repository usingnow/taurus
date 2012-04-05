#encoding:UTF-8
module Promotion::OnlinePromotionsHelper
  def format_online_promotion_status(object)
    (object.status == 1 && Time.now > object.start && Time.now < object.end) ? "进行中" : OnlinePromotion::STATUS[object.status]
  end
end