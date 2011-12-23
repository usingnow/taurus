class ApplicationController < ActionController::Base
  protect_from_forgery

  def paginate(scoped,page,per_page)
     page||=1
     per_page||=10
     [scoped.offset((page.to_i-1)*per_page.to_i).limit(per_page),scoped.count]
  end

  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart =  Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def current_procedure(id)
      if id != nil
        Procedure.find(id)
      else
        procedures = Procedure.find_all_by_active(true)
        procedures[0]
      end
    end
end
