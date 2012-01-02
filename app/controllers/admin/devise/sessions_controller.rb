class Admin::Devise::SessionsController < Devise::SessionsController
  layout "devise"

  def new
    super
  end


  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

    def stub_options(resource)
      super
    end

    def after_sign_out_path_for(resource)
      "/admin/sign_in"
    end

    def after_sign_in_path_for(resource)
      "/admin"
    end
end