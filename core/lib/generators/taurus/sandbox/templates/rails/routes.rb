Rails.application.routes.draw do
	mount Taurus::Core::Engine => "/"
  mount Taurus::Auth::Engine => "/"
  mount Taurus::Cms::Engine => "/"
  mount Taurus::Warehouse::Engine => "/"
end
