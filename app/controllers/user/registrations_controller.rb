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

   def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated if is_navigational_format?
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end

  def create
    build_resource

    resource.user_type = 2

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
      resource.build_company_extend
      respond_with_navigational(resource) { render_with_scope :new }
    end
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