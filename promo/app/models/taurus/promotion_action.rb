#encoding:UTF-8
module Taurus
  class PromotionAction < ActiveRecord::Base
    belongs_to :promotion
    has_many :promotion_action_categories, :dependent => :destroy
    #has_many :promotion_action_products, :dependent => :destroy
    #has_many :promotion_action_gifts, :dependent => :destroy

    validates_uniqueness_of :action_type, :scope => :promotion_id

    def action_type_name
      Promotion::ACTIONS[action_type]
    end
  end
end