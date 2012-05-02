Taurus::Core::Engine.routes.draw do
  namespace :admin do
    resources :images do
    	collection do
		  get :change_page
    	end
    end
    resources :announcements
    resources :slider_bars
    resources :sku_displays
  end
end