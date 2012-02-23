class User::RegistrationsController < Devise::RegistrationsController
  layout "home"

  def new
    super
  end

  def personal
    resource = build_resource({})
    respond_with_navigational(resource){ render_with_scope :personal }
  end
end