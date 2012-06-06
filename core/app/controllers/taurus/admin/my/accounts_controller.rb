module Taurus
	module Admin
		module My
			class AccountsController < BaseController

				def edit
          @administrator = current_administrator
				end

				def update
					@administrator = current_administrator

          if @administrator.update_attributes(params[:administrator])
            flash[:success] = I18n.t('successfully_updated')
            redirect_to(edit_admin_my_account_url)
          else
          	puts @administrator.errors.full_messages.to_s
            render :action => :edit  
          end
				end
			end
		end
  end
end