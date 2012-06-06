#encoding:UTF-8
class Taurus::BaseController < ApplicationController
=begin  
  private
    #CanCan
    def current_ability
      @current_ability ||= Ability.new(current_administrator)
    end

    rescue_from CanCan::AccessDenied do
      render :text => "访问被拒绝！"
    end
=end    
end
