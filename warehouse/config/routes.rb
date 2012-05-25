Taurus::Core::Engine.routes.draw do 
	namespace :admin do
	  #resources :stores
	  resources :store_sku_line_items
	  resources :delivery_records do
      collection do 
        get :orders
      end
      member do 
        get :order_delivery_new
        post :order_delivery_create
      end
	  end
    resources :replenishment_records do 
      collection do 
        get :autocomplete_supplier_name
        get :autocomplete_sku_name
      end
    end
	end
end