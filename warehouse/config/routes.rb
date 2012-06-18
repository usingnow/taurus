Taurus::Core::Engine.routes.draw do 
	namespace :admin do
	  resources :stocks
	  resources :delivery_records
    resources :order_delivery_records
    resources :replenishment_records do 
      collection do 
        get :autocomplete_supplier_name
        get :autocomplete_product_name
      end
    end
	end
end