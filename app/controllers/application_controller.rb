class ApplicationController < ActionController::Base
  protect_from_forgery

  def paginate(scoped,page,per_page)
     page||=1
     per_page||=10
     [scoped.offset((page.to_i-1)*per_page.to_i).limit(per_page),scoped.count]
  end
end
