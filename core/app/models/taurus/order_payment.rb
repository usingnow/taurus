#encoding:UTF-8
module Taurus
  class OrderPayment < ActiveRecord::Base
  	belongs_to :order, :dependent => :destroy
  	belongs_to :payment_method

  	RECEIPT_TYPE = { 0 => '无需发票', 1 => '普通（个人）', 2 => '普通（单位）', 3 => '增值税（单位）' }

  	validates_presence_of :payment_method_id
  	validates_presence_of :receipt_title, :if => Proc.new { receipt_type >= 2 }
  	validates_presence_of :bank_name, :company_name, :bank_account, :registered_telephone, 
  	                      :vat_number, :registered_address, :if => Proc.new { receipt_type == 3 }
  	
  end
end