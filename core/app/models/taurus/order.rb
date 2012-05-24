#encoding:UTF-8
module Taurus
  class Order < ActiveRecord::Base
    attr_accessor :current_step

    STATE = { 
      "start" => "开始", "reserved" => "订单处理中", "waiting_for_payment" => "等待付款",
      "account_paid" => "已付款"
    }
    EVENT = {
      :relieve_reserved => "解除保留", :confirm_online_payment => "确认在线付款", 
      :online_payment => "在线支付"
    }

  	has_one :order_payment, :dependent => :destroy
    accepts_nested_attributes_for :order_payment
  	has_one :order_delivery, :dependent => :destroy
  	accepts_nested_attributes_for :order_delivery
  	has_many :order_product_line_items, :dependent => :destroy
    has_many :products, :through => :order_product_line_items
    has_many :product_sku_line_items, :through => :products
    belongs_to :user

    before_create :default_value
    after_create :judge_reserved
    after_create :add_reserved_amount
    
    validates_presence_of :user_id, :customer_name, :total_payment
    
    # 多步骤表单
    def current_step  
	    @current_step || "new"  
	  end  

    state_machine :initial => :start do
      event :judge_reserved do
        transition :from => :start, :to => :reserved, :if => :reserved?
        transition :from => :start, :to => :waiting_for_payment
      end

      event :relieve_reserved do
        transition :from => :reserved, :to => :waiting_for_payment
      end

      event :online_payment do
        transition :from => :waiting_for_payment, :to => :account_paid
      end

      event :confirm_online_payment do
        transition :from => :waiting_for_payment, :to => :account_paid
      end

      event :product_delivery do
        transition :from => :account_paid, :to => :product_delivered
      end

      event :sign do
        transition :from => :product_delivered, :to => :completed
      end

    end
  	
    def reserved?
      flag = false
      if user.role.is_reserved
        flag = true
      elsif available_stock? 
        flag = true
      end
      flag
    end

    protected
    def default_value
      self.number = Array.new(9){rand(9)}.join
    end

    def available_stock?
      attributes = Array.new
      order_product_line_items.each do |product_line_item|
        product_line_item.product.product_sku_line_items.each do |sku_line_item|
          attributes << {
            :sku_id => sku_line_item.sku_id, 
            :sku_amount => sku_line_item.sku_amount*product_line_item.product_amount
          }
        end
      end
      !StoreSkuLineItem.available?(attributes)
    end
     
    # 增加销售预留
    def add_reserved_amount
      order_product_line_items.each do |product_line_item|
        product_line_item.product.product_sku_line_items.each do |sku_line_item|
          store_sku_line_item = StoreSkuLineItem.find_by_sku_id(sku_line_item.sku_id)
          store_sku_line_item.update_attributes(
            :reserved => store_sku_line_item.reserved += sku_line_item.sku_amount * product_line_item.product_amount
          ) 
        end
      end
    end

  end
end