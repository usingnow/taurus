class User::SessionsController < Devise::SessionsController
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

end