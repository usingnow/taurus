module Taurus
	module Admin
		class PromotionsController < BaseController
			autocomplete :user, :email, :class_name => "Taurus::User"
      autocomplete :role, :name, :class_name => "Taurus::Role"
      autocomplete :product_category, :name, :class_name => "Taurus::ProductCategory"

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
       
        if params[:user_id]
          @promotion_rule = @promotion.promotion_rules.find_by_rule_type("users")
          @promotion_rule.promotion_rule_users.destroy_all

          params[:user_id].each do |user_id|
            @promotion_rule.promotion_rule_users << PromotionRuleUser.new(:user_id => user_id)
          end 
          @promotion_rule.save
        end 

        if params[:role_id]
          @promotion_rule = @promotion.promotion_rules.find_by_rule_type("roles")
          @promotion_rule.promotion_rule_roles.destroy_all

          params[:role_id].each do |role_id|
            @promotion_rule.promotion_rule_roles << PromotionRuleRole.new(:role_id => role_id)
          end 
          @promotion_rule.save
        end

        if params[:order_discount]
          @promotion_action = @promotion.promotion_actions.find_by_action_type("order_discount")
          @promotion_action.update_attributes(:discount => params[:order_discount])
        end 

        if params[:category_id]
          @promotion_action = @promotion.promotion_actions.find_by_action_type("category_discount")

          params[:category_id].each do |category_id|
            @promotion_action.promotion_action_categories << PromotionActionCategory.new(:product_category_id => category_id)
          end
          @promotion_action.discount = params[:category_discount]
          @promotion_action.save
        end

        redirect_to(edit_admin_promotion_url(@promotion))
      end

      def add_user
        @user = User.find(params[:id])
      end

      def add_role
        @role = Role.find(params[:id])
      end

      def add_category
        @product_category = ProductCategory.find(params[:id])
      end
 		end
	end
end