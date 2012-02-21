#encoding:UTF-8
class User::UserCentersController < ApplicationController
  layout "home"

  def index
    @orders = current_user.orders
  end
end