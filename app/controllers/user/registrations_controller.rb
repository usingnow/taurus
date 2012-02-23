class User::RegistrationsController < Devise::RegistrationsController
  layout "home"

  def new
    resource = build_resource({})
    resource.build_company_extend
    respond_with_navigational(resource){ render_with_scope :new }
  end

  def personal
    resource = build_resource({})
    resource.build_person_extend
    respond_with_navigational(resource){ render_with_scope :personal }
  end

  def create

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
    else
      clean_up_passwords(resource)
      resource.build_person_extend
      respond_with_navigational(resource) { render_with_scope :personal }
    end
  end
end