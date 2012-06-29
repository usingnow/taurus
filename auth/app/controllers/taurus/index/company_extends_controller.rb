module Taurus
	module Index
		class CompanyExtendsController < Taurus::Index::BaseController
			before_filter :authenticate_user!
			
      def show
        @company_extend = current_user.userable
      end

      def edit
        @company_extend = current_user.userable
      end

      def update
        @company_extend = current_user.userable
        
        if @company_extend.update_attributes(params[:company_extend])
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to index_company_extend_url
        else
          render :action => "edit"
        end
      end
		end
	end
end