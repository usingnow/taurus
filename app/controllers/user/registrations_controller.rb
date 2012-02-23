class User::RegistrationsController < Devise::RegistrationsController
  layout "home"

  def new
    super
  end
end