#encoding:UTF-8
class DeliveryOrder < ActiveRecord::Base
  belongs_to :store
  belongs_to :administrator
  belongs_to :order
  has_many :prod_del_ordships, :dependent => :destroy

  DELIVERY_TYPE = { 1 => "订单出库", 2 => "内部领用", 3 => "退换货", 4 => "损耗", 5 => "调货", 6 => "其他" }
  LINE_TYPE = { 1 => "自配", 2 => "快递", 3 => "客户自提" }


  validates_presence_of :store_id, :administrator_id, :name, :delivery_type, :number
  validates_presence_of :phone, :if => Proc.new { delivery_type != 1 }
  validates_presence_of :line_type, :delivery_date, :if => Proc.new { delivery_type == 1 }
  validates_presence_of :waybill_number, :if => Proc.new { line_type == 2 }
end
