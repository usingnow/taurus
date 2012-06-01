#encoding:UTF-8
module Taurus
	class PromotionRule < ActiveRecord::Base
    belongs_to :promotion
    validates_uniqueness_of :rule_type, :scope => :promotion_id

    def rule_type_name
      Promotion::RULES[rule_type]
    end
	end
end