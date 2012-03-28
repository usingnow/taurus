#encoding:UTF-8
class StoreEntry < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :ordering_company
  belongs_to :supplier
  belongs_to :store
  belongs_to :administrator
  has_many :product_store_entryships, :dependent => :destroy

  STORE_IN_TYPE = { 1 => "采购入库", 2 => "退换货", 3 => "调货", 4 => "其他" }

  validates_presence_of :ordering_company_id
end
