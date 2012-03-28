#encoding:UTF-8
class DeliveryOrder < ActiveRecord::Base
  belongs_to :store
  belongs_to :administrator
  belongs_to :order
  has_many :prod_del_ordships, :dependent => :destroy

  DELIVERY_TYPE = { 1 => "内部领用", 2 => "退换货", 3 => "损耗", 4 => "调货", 5 => "其他" }


  validates_presence_of :store_id, :administrator_id, :name, :line_type
end
