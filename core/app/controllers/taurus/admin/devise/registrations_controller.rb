class Taurus::Admin::Devise::RegistrationsController < Devise::RegistrationsController
  layout "devise"

  def new
    super
  end
end