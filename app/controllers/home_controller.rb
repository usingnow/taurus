class HomeController < ActionController::Base
  def index
     @skus = Sku.all

     respond_to do |format|
       format.html #index.html.erb
     end
  end
end