#encoding:UTF-8
module Taurus
  class Order < ActiveRecord::Base
  	has_one :order_payment, :dependent => :destroy
    accepts_nested_attributes_for :order_payment
  	has_one :order_delivery, :dependent => :destroy
  	accepts_nested_attributes_for :order_delivery
  	has_many :order_product_line_items, :dependent => :destroy
    before_create :default_value

    attr_accessor :current_step
    
    # 多步骤表单
    def current_step  
	    @current_step || "new"  
	  end  

  	validates_presence_of :user_id, :customer_name, :total_payment
  	

    protected
    def default_value
      self.number = Array.new(9){rand(9)}.join
    end
  end
end