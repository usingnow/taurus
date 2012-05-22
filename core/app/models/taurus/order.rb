#encoding:UTF-8
module Taurus
  class Order < ActiveRecord::Base
  	has_one :order_payment, :dependent => :destroy
    accepts_nested_attributes_for :order_payment
  	has_one :order_delivery, :dependent => :destroy
  	accepts_nested_attributes_for :order_delivery
  	has_many :order_product_line_items, :dependent => :destroy

    attr_accessor :current_step
    
    # 多步骤表单
    def current_step  
	    @current_step || steps.first  
	  end  
	    
	  def steps  
	    %w[new preview]  
	  end

    def next_step  
      self.current_step = steps[steps.index(current_step)+1]  
    end  

    def previous_step  
      self.current_step = steps[steps.index(current_step)-1]  
    end 

  	validates_presence_of :user_id, :customer_name, :total_payment
  	
  end
end