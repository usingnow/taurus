#encoding:UTF-8
class DeliveryOrder < ActiveRecord::Base
  belongs_to :store
  belongs_to :administrator
  belongs_to :order
  has_many :prod_del_ordships, :dependent => :destroy

  DELIVERY_TYPE = { 1 => "订单出库", 2 => "内部领用", 3 => "退换货", 4 => "损耗", 5 => "调货", 6 => "其他" }
  LINE_TYPE = { 1 => "自配", 2 => "快递", 3 => "客户自提" }


  validates_presence_of :store_id, :administrator_id, :name, :line_type
end
