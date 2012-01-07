class Order < ActiveRecord::Base
  has_many :order_details, :dependent => :destroy
  belongs_to :instance, :dependent => :destroy
  belongs_to :user
  belongs_to :administrator, :class_name => "Administrator", :foreign_key => "take_admin_id"
  belongs_to :make_administrator, :class_name => "Administrator", :foreign_key => "created_admin_id"
  has_one :order_pay
  has_many :order_take_logs
  has_many :skus, :through => :order_details
  attr_accessor :condition_type


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
    total_sku_amount+total_install_cost+total_assemble_cost
  end

  validates_presence_of :inner_note, :if => :cancel
  protected
    def cancel
      condition_type == "3"
    end
end
