#encoding:UTF-8
class Order < ActiveRecord::Base
  has_many :order_details, :dependent => :destroy
  belongs_to :instance, :dependent => :destroy
  belongs_to :user
  belongs_to :administrator, :class_name => "Administrator", :foreign_key => "take_admin_id"
  belongs_to :make_administrator, :class_name => "Administrator", :foreign_key => "created_admin_id"
  has_one :order_pay
  has_many :order_take_logs
  has_many :skus, :through => :order_details
  belongs_to :district, :class_name => "District", :foreign_key => "district_no"
  has_many :order_print_logs
  has_one :delivery_order

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
    order_details.to_a.sum { |item| item.install_cost}
  end

  #组装总价
  def total_assemble_cost
    order_details.to_a.sum { |item| item.assemble_cost}
  end

  #合计
  def total_amount
    total_sku_amount+total_install_cost+total_assemble_cost+other_cost+carriage_adjustment
  end

  #统计订单打印次数
  def order_print_sum(line_type)
    order_print_logs.count(:conditions => "line_type = #{line_type}")
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
end
