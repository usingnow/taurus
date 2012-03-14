#encoding:UTF-8
class PurchaseOrder < ActiveRecord::Base
  has_many :po_product_lists, :dependent => :destroy
  belongs_to :ordering_company
  belongs_to :supplier
  belongs_to :administrator
  has_many :store_entries
  scope :released, where(:po_status => 1)

  validates_presence_of :po_time_of_delivery
  validates_numericality_of :ordering_company_id, :supplier_id, :only_integer => true, :message => "不能为空"

  def self.po_status_enum
    { 0 => "保存", 1 => "已发布", 2 => "已关闭" }
  end

  def self.po_store_status_enum
    { false => "待入库", true => "已入库" }
  end


  def add_po_product(product_id)
    current_po_product = po_product_lists.find_by_product_id(product_id)
    if current_po_product
     current_po_product.product_purchase_amount += 1
    else
      product = Product.find(product_id)
      current_po_product = po_product_lists.build(:product_id => product_id, :product_purchase_amount => 1, :product_unit_price => product.cost_aft_tax)
    end
    current_po_product
  end

  #采购单商品总金额
  def price
    po_product_lists.to_a.sum { |list| list.product_unit_price*list.product_purchase_amount }
  end

  #采购单入库商品总金额
  def store_price
    po_product_lists.to_a.sum { |list| list.store_price }
  end
end
