#encoding:UTF-8
module Taurus
  module Index
    class UserRegistrationsController < Devise::SessionsController
      layout '/taurus/layouts/index'
      
      #个人用户注册
      def new
        @person_extend = PersonExtend.new
        resource = build_resource({})
        respond_with resource
      end

      def create
        @person_extend = PersonExtend.new params[:person_extend]
        @person_extend.user.status = true
        @person_extend.user.role_id = 1


        if @person_extend.save
          if @person_extend.user.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_in(resource_name, @person_extend.user)
            respond_with resource, :location => after_sign_up_path_for(@person_extend.user)
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
      def personal
        resource = build_resource({})
        resource.build_person_extend
        respond_with_navigational(resource){ render_with_scope :personal }
      end

      def create_personal
        build_resource

        resource.user_type = 1

        if resource.save
          if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_in(resource_name, resource)
            respond_with resource, :location => after_sign_up_path_for(resource)
          else
            set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
            expire_session_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
          resource.update_attribute(:confirmed_at, Time.now)
        else
          clean_up_passwords(resource)
          resource.build_person_extend
          respond_with_navigational(resource) { render_with_scope :personal }
        end
      end
    end
  end
end