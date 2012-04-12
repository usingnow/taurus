#encoding:UTF-8
class Order < ActiveRecord::Base
  has_many :order_details, :dependent => :destroy
  belongs_to :instance, :dependent => :destroy
  belongs_to :user
  belongs_to :administrator, :class_name => "Administrator", :foreign_key => "take_admin_id"
  belongs_to :make_administrator, :class_name => "Administrator", :foreign_key => "created_admin_id"
  has_one :order_pay, :dependent => :destroy
  has_many :order_take_logs, :dependent => :destroy
  has_many :skus, :through => :order_details
  belongs_to :district, :class_name => "District", :foreign_key => "district_no"
  has_many :order_print_logs, :dependent => :destroy
  has_one :delivery_order
  has_many :promotions_in_orders, :dependent => :destroy
  has_many :online_promotions, :through => :promotions_in_orders
  has_many :promotion_gifts, :dependent => :destroy

  attr_accessor :condition_type

  INVOICE_TYPE = { 0 => "普通", 1 => "增值税发票", 2 => "不需要" }
  INVOICE_HEAD = { 0 => "个人", 1 => "单位" }


  def add_cart_skuships_from_cart(cart)
    cart.cart_skuships.each do |sku|
      sku.cart_id = nil
      cart_skuships << sku
    end
  end

  def total_skus
    order_details.sum(:quantity)
  end

  def total_details
    order_details.size
  end

  def next_action
    instance.procedure.station_procedureships.find_all{|s| s.station_id == instance.station_id && s.condition.condition_type == 1}
  end

  #商品总价
  def total_sku_amount
    order_details.to_a.sum { |item| item.unit_price*item.quantity }
  end

  #安装总价
  def total_install_cost
    order_details.to_a.sum { |item| item.is_need_install ? item.install_cost : 0 }
  end

  #组装总价
  def total_assemble_cost
    order_details.to_a.sum { |item| item.is_need_assemble ? item.assemble_cost : 0 }
  end

  #合计
  def total_amount
    total_sku_amount+total_install_cost+total_assemble_cost+other_cost+carriage_adjustment
  end

  #统计订单打印次数
  def order_print_sum(line_type)
    order_print_logs.count(:conditions => "line_type = #{line_type}")
  end


  def promotion_sku_price
    order_details.to_a.sum { |item| item.promotion_sku_price }
  end

  def promotion_installation_cost
    order_details.to_a.sum { |item| item.promotion_installation_cost }
  end

  def promotion_assembling_fee
    order_details.to_a.sum { |item| item.promotion_assembling_fee }
  end

  def promotion_carriage_cost
    promotion_content(:free_delivery) ? 0 : carriage_cost
  end

  def promotion_carriage_adjustment
    promotion_content(:free_delivery) ? 0 : carriage_adjustment
  end

  def promotion_price
    promotion_sku_price + promotion_installation_cost + promotion_assembling_fee + promotion_carriage_adjustment + other_cost
  end

  def price_no_carriage
    total_sku_amount+total_install_cost+total_assemble_cost+other_cost
  end

  def admin_order_amount(options={})
    if options[:sku_category_ids]
      order_details.find_all { |c| options[:sku_category_ids].member?(c.sku.sku_category_id) }.sum { |c| c.quantity }
    elsif options[:brand_ids]
      order_details.find_all { |c| options[:brand_ids].member?(c.sku.brand_id) }.sum { |c| c.quantity }
    elsif options[:sku_ids]
      order_details.find_all { |c| options[:sku_ids].member?(c.sku_id) }.sum { |c| c.quantity }
    else
      order_details.sum(:quantity)
    end
  end



  validates_format_of :mobile,
                      :with => /^13[0-9]{1}[0-9]{8}$|^15[012356789]{1}[0-9]{8}$|^18[0256789]{1}[0-9]{8}$/,
                      :message => "格式不正确"

  validates_presence_of :user_id, :address, :name, :district_no, :invoice_type
  validates_presence_of :is_invoice_head, :if => Proc.new { invoice_type != 2 }
  validates_presence_of :company_name, :if => Proc.new { is_invoice_head == 1 }
  validates_presence_of :account_bank, :account_person_name, :account_phone, :account_no, :added_value_tax_no,
                        :account_reg_add, :if => Proc.new { invoice_type == 1 }


  validates_presence_of :inner_note, :if => :cancel
  protected
    def cancel
      condition_type == "3"
    end

    def promotion_content(method)
      result = {:promotion_gifts => [], :free_delivery => false}
      case method
      when :promotion_gifts
        online_promotions.each do |o|
          if o.sku_id
            gift = result[:promotion_gifts].find { |g| g.sku_id == o.sku_id }
            if gift
              gift.amount += 1
            else
              result[:promotion_gifts] << PromotionGift.new(:sku_id => o.sku_id)
            end
          end
        end
      when :free_delivery
        online_promotions.order_promotions.each do |p|
          result[:free_delivery] = true if p.online_promotionable.free_delivery == true
        end
      end
      result[method]
    end

end
