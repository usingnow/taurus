module Taurus
	module Index
		class PersonExtendsController < Taurus::Index::BaseController
			before_filter :authenticate_user!
			
      def show
        @person_extend = current_user.userable
      end

      def edit
        @person_extend = current_user.userable
      end

      def update
        @person_extend = current_user.userable
        
        if @person_extend.update_attributes(params[:person_extend])
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to index_person_extend_url
        else
          render :action => "edit"
        end
      end
		end
	end
end