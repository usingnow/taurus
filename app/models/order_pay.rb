class OrderPay < ActiveRecord::Base
  belongs_to :province, :class_name => "Province", :foreign_key => "province_no"
  belongs_to :bank
  belongs_to :order

  validates_presence_of :buyer_alipay_no, :alipay_no
  validates_numericality_of :alipay_price
end
