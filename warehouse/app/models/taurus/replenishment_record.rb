#encoding:UTF-8
module Taurus
	class ReplenishmentRecord < ActiveRecord::Base
    attr_accessor :supplier_name, :sku_number, :sku_name, :sku_id, :sku_amount
    REPLENISHMENT_TYPE = { 0 => "进货", 1 => "退换货", 2 => "其他" }

    has_many :replenishment_record_sku_line_items, :dependent => :destroy

    before_create :default_value

    validates_presence_of :supplier_name, :supplier_id, :replenishment_type
    validate :line_items_empty?

    protected
    def default_value
      self.number = "S" + Array.new(9){rand(9)}.join
      self.store_id = 1
    end

    def line_items_empty?
      errors.add(:sku_name, "至少有一个SKU") if replenishment_record_sku_line_items.empty?
    end 
	end
end