#encoding:UTF-8
module Promotion::OnlinePromotionsHelper
  def promotion_release_link(start)
    if Time.now < start
      link_to "发布活动", release_promotion_online_promotion_path(@online_promotion), :class => "longbtn",
            :confirm => "确认发布么？", :method => :put
    else
      link_to "发布活动", "#", :class => "longbtn", :onclick => "return alert('开始时间早于当前时间,不能发布。')"
    end
  end
end