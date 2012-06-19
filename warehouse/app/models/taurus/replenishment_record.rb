#encoding:UTF-8
module Taurus
  class ReplenishmentRecord < ActiveRecord::Base
    attr_accessor :product_number, :product_name, :product_id, :product_amount
    REPLENISHMENT_TYPE = { 0 => "进货", 1 => "退换货", 2 => "其他" }

    has_many :replenishment_record_product_line_items, :dependent => :destroy

    before_create :default_value

    validates_presence_of :supplier_name, :supplier_id, :replenishment_type
    validate :line_items_empty?

    protected
    def default_value
      self.number = "S" + Array.new(9){rand(9)}.join
    end

    def line_items_empty?
      errors.add(:product_name, "至少有一个商品") if replenishment_record_product_line_items.empty?
    end 
  end
end