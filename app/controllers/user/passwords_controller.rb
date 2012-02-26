class User::PasswordsController < Devise::PasswordsController
  layout "home"
  def new
    super
  end
end