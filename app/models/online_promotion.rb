#encoding:UTF-8
class OnlinePromotion < ActiveRecord::Base
  belongs_to :online_promotionable, :polymorphic => true, :dependent => :destroy
  belongs_to :procedure
  belongs_to :sku
  has_many :promotion_members

  attr_accessor :current_step, :administrator_id

  PROMOTION_TYPE = { 1 => "对客户", 2 => "对购物" }
  SIGN_UP_TIME_LIMIT = { false => "无限制", true => "有限制" }
  FREE_INSTALLATION = { false => "否", true => "是" }
  FREE_ASSEMBLING = { false => "否", true => "是" }
  POINTS_PROMOTION_METHOD = { 0 => "无", 1 => "额外赠送积分", 2 => "积分倍率" }
  MEMBER_TYPE = { 0 => "全部会员", 1 => "分类会员", 2 => "特定会员" }
  ORDER_CHANNEL = { 0 => "无限制", 1 => "前台下单", 2 => "后台下单" }
  ONLINE_PROMOTIONABLE = { "PromotionByOrder" => "订单类", "PromotionByProduct" => "商品类" }
  STATUS = { 0 => "保存", 1 => "已确认", 2 => "已关闭" }


  validates_presence_of :code, :title, :promotion_type, :status, :start, :end, :description
  validates_uniqueness_of :code
  validate :member_exists?

  protected
    def member_exists?
      unless member_type == 0
        if current_step == "preview"
          count = PromotionMemberTemp.count(:conditions => "administrator_id = #{administrator_id} and member_type = #{member_type}")
          if count == 0
            errors.add(:member_type,"不能为空")
          end
        elsif current_step == "save"
          count = promotion_members.count
          if count == 0
            errors.add(:member_type,"不能为空")
          end
        end
      end
    end
end
