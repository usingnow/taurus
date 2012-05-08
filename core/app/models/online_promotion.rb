#encoding:UTF-8
class OnlinePromotion < ActiveRecord::Base
  belongs_to :online_promotionable, :polymorphic => true, :dependent => :destroy
  belongs_to :procedure
  belongs_to :sku
  has_many :promotion_members, :dependent => :destroy
  has_many :promotion_products, :dependent => :destroy
  has_many :low_promotions, :class_name => "PromotionPriority", :foreign_key => "promotion_high", :dependent => :destroy
  has_many :high_promotions, :class_name => "PromotionPriority", :foreign_key => "promotion_low", :dependent => :destroy

  scope :progress_order_promotions, search(:status_eq => 1,:start_lt => Time.now, :end_gt => Time.now, :online_promotionable_type_eq => "PromotionByOrder").result
  scope :progress_product_promotions, search(:status_eq => 1,:start_lt => Time.now, :end_gt => Time.now, :online_promotionable_type_eq => "PromotionByProduct").result
  scope :order_by_created_at, order("created_at desc")

  scope :product_promotions, search(:online_promotionable_type_eq => "PromotionByProduct").result
  scope :order_promotions, search(:online_promotionable_type_eq => "PromotionByOrder").result

  def self.not_in_priorities(id)
    where("id not in(select promotion_low from promotion_priorities where promotion_high = #{id} union all
                           (select promotion_high from promotion_priorities where promotion_low = #{id})) and id != #{id}")
  end

  attr_accessor :current_step, :administrator_id


  def self.current_product_promotions(online_promotions,options={})
    result = []
    ids = []
    online_promotions.each do |p|
      flag = []
      if options[:sku] && options[:user]
        case p.online_promotionable.products_selection
          when 0
            if options[:site] == "admin_order"
              amount = options[:order].admin_order_amount
            elsif options[:site] == "cart_nds"
              amount = options[:cart].total_nds_items
            elsif options[:site] == "cart_ds"
              amount = options[:cart_sku].quantity
            else
              amount = options[:user].admin_amount
            end
            flag << (p.online_promotionable.basis_parameter <= amount) if p.online_promotionable.basis_parameter > 0
          when 1
            ids = []
            p.promotion_products.each { |s| ids += s.sku_category.children.map(&:id)+s.product_info.to_a }
            flag << ids.member?(poptions[:sku].sku_category_id.to_i)
            if options[:site] == "admin_order"
              amount = options[:order].admin_order_amount(:sku_category_ids => ids)
            elsif options[:site] == "cart_nds"
              amount = options[:cart].total_nds_items(:sku_category_ids => ids)
            elsif options[:site] == "cart_ds"
              amount = options[:cart_sku].quantity
            else
              amount = options[:user].admin_amount(:sku_category_ids => ids)
            end
            flag << (p.online_promotionable.basis_parameter <= amount) if p.online_promotionable.basis_parameter > 0
          when 2
            ids = p.promotion_products.map(&:product_info)
            flag << ids.member?(options[:sku].brand_id)
            if options[:site] == "admin_order"
              amount = options[:order].admin_order_amount(:brand_ids => ids)
            elsif options[:site] == "cart_nds"
              amount = options[:cart].total_nds_items(:brand_ids => ids)
            elsif options[:site] == "cart_ds"
              amount = options[:cart_sku].quantity
            else
              amount = options[:user].admin_amount(:brand_ids => ids)
            end
            flag << (p.online_promotionable.basis_parameter <= amount) if p.online_promotionable.basis_parameter > 0
          when 3
            ids = p.promotion_products.map(&:product_info)
            flag << ids.member?(options[:sku].id)
            if options[:site] == "admin_order"
              amount = options[:order].admin_order_amount(:sku_ids => ids)
            elsif options[:site] == "cart_nds"
              amount = options[:cart].total_nds_items(:sku_ids => ids)
            elsif options[:site] == "cart_ds"
              amount = options[:cart_sku].quantity
            else
              amount = options[:user].admin_amount(:sku_ids => ids)
            end
            flag << (p.online_promotionable.basis_parameter <= amount) if p.online_promotionable.basis_parameter > 0
        end
      end

      if p.min_member_point > 0 && options[:user]
        flag << (p.min_member_point < options[:user].points)
      end
      if p.sign_up_time_limit && options[:user]
        flag << ((p.member_sign_up_start.to_i..p.member_sign_up_end.to_i) === options[:user].created_at.to_i)
      end
      if p.member_type != 0 && options[:user]
        flag << (p.promotion_members.map(&:member_info).member?(p.member_type == 1 ? options[:user].role.id : options[:user].id))
      end
      if p.order_channel != 0
        flag << (p.order_channel == options[:order_channel])
      end
      if p.procedure_id && options[:user]
        flag << (p.procedure_id == options[:user].inner_order_payment.procedure_id)
      end
      if !flag.member?(false)
        result << p
        ids += p.low_promotions.map(&:promotion_low)
      end
    end
    result.find_all { |r| !ids.member?(r.id.to_i) }
  end

  def self.promotion_content(product_promotions,order_promotions,method,options={})
    result = {:product_discount => 1, :free_installation => false, :free_assembling => false, :points => {:points => 0, :rate => 1}}
    product_points = 0
    product_rate = 1
    current_product_promotions(product_promotions,options).each do |p|
      result[:product_discount] = p.online_promotionable.product_discount if p.online_promotionable.product_discount < result[:product_discount]
      result[:free_installation] = true if p.free_installation == true
      result[:free_assembling] = true if p.free_assembling == true
      case p.points_promotion_method
        when 1
          product_points = p.points_promotion_parameter if p.points_promotion_parameter > product_points
        when 2
          product_rate = p.points_promotion_parameter if p.points_promotion_parameter > product_rate
      end
    end

    if options[:site] == "admin_order"
      amount = options[:order].admin_order_amount
      price = options[:order].price_no_carriage
      procedure_id = options[:order].instance.procedure_id
    elsif options[:site] == "cart_nds"
      amount = options[:cart].total_nds_items
      price = options[:cart].total_nds_amount
      procedure_id = options[:user].inner_order_payment.procedure_id
    elsif options[:site] == "cart_ds"
      amount = options[:cart_sku].quantity
      price = options[:cart_sku].subtotal
      procedure_id = options[:user].inner_order_payment.procedure_id
    else
      amount = options[:user].admin_amount
      price = options[:user].admin_price
      procedure_id = options[:user].inner_order_payment.procedure_id
    end
    order_options = {:order_payment_over => price*result[:product_discount],
                     :purchase_amount_limit => amount, :user => options[:user],
                     :order_channel => 2, :procedure_id => procedure_id}

    order_points = 0
    order_rate = 1
    current_order_promotions(order_promotions,order_options).each do |p|
      result[:product_discount] = p.online_promotionable.discount if p.online_promotionable.discount < result[:product_discount]
      result[:free_installation] = true if p.free_installation == true
      result[:free_assembling] = true if p.free_assembling == true
      case p.points_promotion_method
        when 1
          order_points = p.points_promotion_parameter if p.points_promotion_parameter > order_points
        when 2
          order_rate = p.points_promotion_parameter if p.points_promotion_parameter > order_rate
      end
    end
    result[:points] = {:rate => (product_rate*order_rate).to_i, :points => (product_points+order_points).to_i}
    result[method]
  end


  #符合条件的订单活动
  #  参数为订单活动的规则
  def self.current_order_promotions(online_promotions,options={})
    result = []
    ids = []
    online_promotions.each do |p|
      flag = []
      if p.online_promotionable.order_payment_over > 0 && options[:order_payment_over]
        flag << (p.online_promotionable.order_payment_over < options[:order_payment_over])
      end
      if p.online_promotionable.purchase_amount_limit > 0 && options[:purchase_amount_limit]
        flag << (p.online_promotionable.purchase_amount_limit < options[:purchase_amount_limit])
      end
      if p.min_member_point > 0 && options[:user]
        flag << (p.min_member_point < options[:user].points)
      end
      if p.sign_up_time_limit && options[:user]
        flag << ((p.member_sign_up_start.to_i..p.member_sign_up_end.to_i) === options[:user].created_at.to_i)
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
        ids += p.low_promotions.map(&:promotion_low)
      end
    end
    result.find_all { |r| !ids.member?(r.id.to_i) }
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
        count = PromotionMemberTemp.count(:conditions => "administrator_id = #{administrator_id} and member_type = #{member_type}")
        if count == 0
          errors.add(:member_type,"不能为空")
        end
      end
    end
end
