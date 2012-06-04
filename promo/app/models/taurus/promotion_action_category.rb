#encoding:UTF-8
module Taurus
	class PromotionActionCategory < ActiveRecord::Base
    belongs_to :promotion_action
    belongs_to :product_category

    validates_uniqueness_of :product_category_id, :scope => :promotion_action_id
	end
end