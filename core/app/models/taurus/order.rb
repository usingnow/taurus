#encoding:UTF-8
module Taurus
  class Order < ActiveRecord::Base
    attr_accessor :current_step

    STATE = { 
      "start" => "开始", "reserved" => "订单处理中", "waiting_for_payment" => "等待付款",
      "delivering" => "正在拣货出库", "product_delivered" => "等待签收", "completed" => "完成"
    }
    EVENT = {
      :relieve_reserved => "解除保留", :confirm_online_payment => "确认在线付款", 
      :online_payment => "在线支付", :sign => "签收"
    }

  	has_one :order_payment, :dependent => :destroy
    accepts_nested_attributes_for :order_payment
  	has_one :order_delivery, :dependent => :destroy
  	accepts_nested_attributes_for :order_delivery
  	has_many :order_product_line_items, :dependent => :destroy
    has_many :products, :through => :order_product_line_items
    belongs_to :user

    before_validation :generate_order_number, :on => :create
    after_create :first_state
    after_create :add_reserved_amount
    
    validates_presence_of :user_id, :customer_name, :total_payment
    validates_uniqueness_of :number

    scope :available_deliveries, where(:state => "delivering")
    scope :processing, where("state != 'completed'")
    
    # 多步骤表单
    def current_step  
	    @current_step || "new"  
	  end  

    state_machine :initial => :start do
      event :first_state do
        transition :from => :start, :to => :waiting_for_payment, 
                   :if => Proc.new{ |order| order.order_payment.payment_method_id == 1 }
        transition :from => :start, :to => :delivering
      end

      event :relieve_reserved do
        transition :from => :reserved, :to => :waiting_for_payment
      end

      event :online_payment do
        transition :from => :waiting_for_payment, :to => :delivering
      end

      event :confirm_online_payment do
        transition :from => :waiting_for_payment, :to => :delivering
      end

      event :product_delivery do
        transition :from => :delivering, :to => :product_delivered
      end

      event :sign do
        transition :from => :product_delivered, :to => :completed
      end

    end
  	
    protected
    def generate_order_number
      self.number = "O" + Array.new(9){rand(9)}.join
    end

    # 增加销售预留
    def add_reserved_amount
      order_product_line_items.each do |product_line_item|
        product_line_item.product.stock.update_attributes(
          :reserved => product_line_item.product.stock.reserved += product_line_item.product_amount
        ) 
      end
    end

  end
end