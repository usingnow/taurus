#encoding:UTF-8
class PurchaseOrder < ActiveRecord::Base
  has_many :po_product_lists, :dependent => :destroy
  belongs_to :ordering_company
  belongs_to :supplier

  validates_presence_of :po_time_of_delivery
  validates_numericality_of :ordering_company_id, :supplier_id, :only_integer => true, :message => "不能为空"
end
