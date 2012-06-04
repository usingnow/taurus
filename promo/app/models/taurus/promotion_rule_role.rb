#encoding:UTF-8
module Taurus
	class PromotionRuleRole < ActiveRecord::Base
    belongs_to :promotion_rule
    belongs_to :role

    validates_uniqueness_of :role_id, :scope => :promotion_rule_id
	end
end