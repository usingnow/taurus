#encoding:UTF-8
module Taurus
	class PromotionRule < ActiveRecord::Base
    belongs_to :promotion
    has_many :promotion_rule_users, :dependent => :destroy
    has_many :promotion_rule_roles, :dependent => :destroy


    validates_uniqueness_of :rule_type, :scope => :promotion_id

    def rule_type_name
      Promotion::RULES[rule_type]
    end
	end
end