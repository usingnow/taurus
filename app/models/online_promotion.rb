#encoding:UTF-8
class OnlinePromotion < ActiveRecord::Base
  belongs_to :online_promotionable, :polymorphic => true, :dependent => :destroy
  belongs_to :procedure
  belongs_to :sku
  has_many :promotion_members, :dependent => :destroy
  has_many :promotion_products, :dependent => :destroy


  attr_accessor :current_step, :administrator_id

  scope :progress_promotions, search(:status_eq => 1,:start_lt => Time.now, :end_gt => Time.now).result

  def self.not_in_priorities(id)
    where("id not in(select promotion_low from promotion_priorities where promotion_high = #{id} union all
                           (select promotion_high from promotion_priorities where promotion_low = #{id})) and id != #{id}")
  end

  #符合条件的订单活动
  #  参数为订单活动的规则
  def self.current_order_promotions(options={})
    result = []
    progress_promotions.each do |p|
      flag = []
      if p.online_promotionable.order_payment_over > 0 && options[:order_payment_over]
        flag << (p.online_promotionable.order_payment_over < options[:order_payment_over])
      end
      if p.online_promotionable.purchase_amount_limit > 0 && options[:purchase_amount_limit]
        flag << (p.online_promotionable.purchase_amount_limit < options[:purchase_amount_limit])
      end
      if p.min_member_point > 0 && options[:min_member_point]
        flag << (p.online_promotionable.min_member_point < options[:min_member_point])
      end
      if p.sign_up_time_limit && options[:member_sign_up_time]
        flag << (p.member_sign_up_start < options[:member_sign_up_time] && p.member_sign_up_end > options[:member_sign_up_time])
      end
      if p.member_type != 0 && options[:user]
        flag << (p.promotion_members.map(&:member_info).member?(p.member_type == 1 ? options[:user].role.id : options[:user].id))
      end
      if p.order_channel != 0 && options[:order_channel]
        flag << (p.order_channel == options[:order_channel])
      end
      if p.procedure_id && options[:procedure_id]
        flag << (p.procedure_id == options[:procedure_id])
      end
      if flag.any? && !flag.member?(false)
        result << p
      end
    end
    result
  end

  def self.get_order_promotion_contents(options={})
    result = []
    current_orders(options).each do |p|
      result << {:discount => p.online_promotionable.discount, :free_installation => p.free_installation,
                 :free_assembling => p.free_assembling, :free_delivery => p.online_promotionable.free_delivery,
                 :points_promotion_method => p.points_promotion_method,
                 :points_promotion_parameter => p.points_promotion_parameter, :sku_id => p.sku_id}
    end
    result
  end

  PROMOTION_TYPE = { 1 => "对客户", 2 => "对购物" }
  SIGN_UP_TIME_LIMIT = { false => "无限制", true => "有限制" }
  FREE_INSTALLATION = { false => "否", true => "是" }
  FREE_ASSEMBLING = { false => "否", true => "是" }
  POINTS_PROMOTION_METHOD = { 0 => "无", 1 => "额外赠送积分", 2 => "积分倍率" }
  MEMBER_TYPE = { 0 => "全部会员", 1 => "分类会员", 2 => "特定会员" }
  ORDER_CHANNEL = { 0 => "无限制", 1 => "前台下单", 2 => "后台下单" }
  ONLINE_PROMOTIONABLE = { "PromotionByOrder" => "订单类", "PromotionByProduct" => "商品类" }
  STATUS = { 0 => "保存", 1 => "已确认", 2 => "已关闭" }
  PROGRESS = { 0 => "", 1 => "未开始", 2 => "进行中", 3 => "已结束" }

  def progress
    case status
    when 1
      if Time.now < start
        value = 1
      elsif Time.now > self.end
        value = 3
      else
        value = 2
      end
    else
      value = 0
    end
    value
  end

  validates_presence_of :code, :title, :promotion_type, :status, :start, :end, :description
  validates_uniqueness_of :code
  validates_presence_of :remarks, :if => Proc.new { current_step == "close" }
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
