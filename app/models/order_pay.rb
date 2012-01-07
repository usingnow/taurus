class OrderPay < ActiveRecord::Base
  belongs_to :province, :class_name => "Province", :foreign_key => "province_no"
  belongs_to :bank
  belongs_to :order
  attr_accessor :condition_type

  validates_numericality_of :alipay_price, :if => :paid
  validates_presence_of :buyer_alipay_no, :alipay_no, :if => :paid
  validates_numericality_of :price, :if => :input_pay_info


  protected
    def paid
      condition_type == "1"
    end

    def input_pay_info
      condition_type == "2"
    end
end
