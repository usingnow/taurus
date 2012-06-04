module Taurus
	module Admin
		class PromotionActionsController < BaseController
      def create
        @promotion_action = PromotionAction.new(:promotion_id => params[:promotion_id], :action_type => params[:action_type])
        @promotion_action.save
      end

      def destroy
        @promotion_action = PromotionAction.find(params[:id])
        @promotion_action.destroy
      end
 		end
	end
end