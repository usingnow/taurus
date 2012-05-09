module Taurus
  module Admin
    class AdminSessionsController < Devise::SessionsController
      layout '/taurus/layouts/devise'

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
