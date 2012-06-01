Taurus::Core::Engine.routes.draw do
  namespace :admin do
    resources :images do
    	collection do
		    get :change_page
    	end
    end
    resources :announcements
    resources :slider_bars
    resources :product_displays do 
      get :autocomplete_product_name, :on => :collection
    end
  end
end