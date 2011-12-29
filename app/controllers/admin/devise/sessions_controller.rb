class Admin::Devise::SessionsController < Devise::SessionsController
  layout "devise"

  def new
    super
  end


  # POST /resource/sign_in
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  def destroy

  end

  protected

  def stub_options(resource)
    super
  end
end