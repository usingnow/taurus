module Taurus
  module Admin
    class AdminSessionsController < Devise::SessionsController
      skip_before_filter :verify_authenticity_token
      layout '/taurus/layouts/devise'
      
      def create
        respond_to do |format|
          format.json do
            resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
            sign_in(resource_name, resource)
            render :json => { :success => true }
          end

          format.html { super }
        end
      end

      def failure
        render :json => {:success => false, :error => I18n.t("devise.failure.invalid")}
      end

      def destroy
        redirect_path = after_sign_out_path_for(resource_name)
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        set_flash_message :notice, :signed_out if signed_out

        # We actually need to hardcode this as Rails default responder doesn't
        # support returning empty response on GET request
        respond_to do |format|
          format.json { render :json => "success".to_json }
          format.html { redirect_to redirect_path }
          format.all do
            head :no_content
          end
        end
      end

      protected
      def after_sign_in_path_for(resource_or_scope)
        "/admin"
      end

      def after_sign_out_path_for(resource_or_scope)
        "/admin/sign_in"
      end
    end
  end
end