#encoding:UTF-8
module Taurus
	class PromotionRuleUser < ActiveRecord::Base
    belongs_to :promotion_rule
    belongs_to :user

    validates_uniqueness_of :user_id, :scope => :promotion_rule_id
	end
end