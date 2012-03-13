#encoding:UTF-8
class PurchaseOrder < ActiveRecord::Base
  has_many :po_product_lists, :dependent => :destroy
  belongs_to :ordering_company
  belongs_to :supplier
  belongs_to :administrator

  validates_presence_of :po_time_of_delivery
  validates_numericality_of :ordering_company_id, :supplier_id, :only_integer => true, :message => "不能为空"

  def add_po_product(product_id)
    current_po_product = po_product_lists.find_by_product_id(product_id)
    if current_po_product
     current_po_product.product_purchase_amount += 1
    else
      current_po_product = po_product_lists.build(:product_id => product_id, :product_purchase_amount => 1)
    end
    current_po_product
  end

  def price
    po_product_lists.to_a.sum { |list| list.product_unit_price*list.product_purchase_amount }
  end
end
