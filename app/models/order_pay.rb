class OrderPay < ActiveRecord::Base
  belongs_to :province, :class_name => "Province", :foreign_key => "province_no"
  belongs_to :bank
end
