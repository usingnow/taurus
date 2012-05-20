#encoding:UTF-8
module Taurus
  module Index
    class UserRegistrationsController < Devise::SessionsController
      layout '/taurus/layouts/index'
      
      #个人用户注册
      def new
        @person_extend = PersonExtend.new
        @person_extend.user = User.new
      end

      def create
        params[:person_extend][:user_attributes] = params[:person_extend][:user_attributes].merge(:role_id => 1)

        @person_extend = PersonExtend.new params[:person_extend]

        if @person_extend.save
          if @person_extend.user.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_in(resource_name, @person_extend.user)
            respond_with resource, :location => index_home_index_url
          else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
            expire_session_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords @person_extend
          respond_with @person_extend
        end
      end

      #企业用户注册
      def new_company
        @company_extend = CompanyExtend.new
        @company_extend.user = User.new
      end

      def create_company
        params[:company_extend][:user_attributes] = params[:company_extend][:user_attributes].merge(:role_id => 1)

        @company_extend = CompanyExtend.new params[:company_extend]

        if @company_extend.save
          if @company_extend.user.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_in(resource_name, @company_extend.user)
            respond_with resource, :location => index_home_index_url
          else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
            expire_session_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords @company_extend
          render :action => "new_company"
        end
      end
    end
  end
end