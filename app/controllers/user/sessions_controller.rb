#encoding:UTF-8
class User::SessionsController < Devise::SessionsController
  layout "home"

  def new
    super
  end


  def create
    if session[:code] == params[:code]
      super
    else
      redirect_to new_user_session_url, :alert => "验证码错误"
    end
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