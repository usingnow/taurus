module Taurus
	module Admin
		class PromotionRulesController < BaseController
      def create
        @promotion_rule = PromotionRule.new(:promotion_id => params[:promotion_id], :rule_type => params[:rule_type])
        @promotion_rule.save
      end

      def destroy
        @promotion_rule = PromotionRule.find(params[:id])
        @promotion_rule.destroy
      end
 		end
	end
end