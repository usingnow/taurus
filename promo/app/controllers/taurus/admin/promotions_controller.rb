module Taurus
	module Admin
		class PromotionsController < BaseController
			autocomplete :user, :email, :class_name => "Taurus::User"

      def index
        @search = Promotion.search(params[:q])
        @promotions = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def new
        @promotion = Promotion.new
      end

      def create
        @promotion = Promotion.new(params[:promotion])

        if @promotion.save
        	redirect_to(edit_admin_promotion_url(@promotion))
        else
          render :action => :new
        end
      end

      def edit
        @promotion = Promotion.find(params[:id])
      end

      def update
        @promotion = Promotion.find(params[:id])
        
        @promotion.update_attributes(params[:promotion]) if params[:promotion]

        if params[:item_total]
        	@promotion_rule = @promotion.promotion_rules.find_by_rule_type("item_total")
          @promotion_rule.update_attributes(:item_total => params[:item_total])
        end

        redirect_to(edit_admin_promotion_url(@promotion))
      end

      def add_user
        @user = User.find(params[:id])
      end
 		end
	end
end