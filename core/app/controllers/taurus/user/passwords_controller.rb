class User::PasswordsController < Devise::PasswordsController
  layout "home"

  def new
    super
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    if successfully_sent?(resource)
      respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with_navigational(resource){ render_with_scope :new }
    end
  end

end