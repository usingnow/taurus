class HomeController < ActionController::Base
  def index
     @pick_ups = PickUp.all
  end
end