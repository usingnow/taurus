module Taurus
  module Admin
    class AdminSessionsController < Devise::SessionsController
      layout '/taurus/layouts/devise'

      def create
        respond_to do |format|
          format.json do
            resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
            sign_in(resource_name, resource)
            render :json => {:success => true, :content => "abc"}
          end

          format.html { super }
        end
      end

      def failure
        render :json => {:success => false, :errors => ["Login failed."]}
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