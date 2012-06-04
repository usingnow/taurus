#encoding:UTF-8
module Taurus
	class Promotion < ActiveRecord::Base
    EVENT_NAME = { 0 => "添加到购物车" }
    RULES = { "item_total" => "商品总金额", "users" => "客户", "roles" => "客户角色" }
    ACTIONS = { "order_discount" => "订单折扣", "category_discount" => "分类商品折扣", "product_discount" => "商品折扣", 
                "gift" => "赠品", "points" => "积分", "free_shipping" => "免运费" }
    attr_accessor :rule, :action
    has_many :promotion_rules
    has_many :promotion_actions

    validates_presence_of :name, :event_name, :usage_limit, :starts_at, :expires_at
    validates_numericality_of :usage_limit, :only_integer => true, :greater_than => 0

    def surplus_of_rule
      result = Hash[RULES]
      promotion_rules.each do |rule|
        result.delete(rule.rule_type)
      end
      result
    end

    def surplus_of_action
      result = Hash[ACTIONS]
      promotion_actions.each do |action|
        result.delete(action.action_type)
      end
      result
    end
	end
end