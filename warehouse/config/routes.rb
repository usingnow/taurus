Taurus::Core::Engine.routes.draw do 
	namespace :admin do
	  #resources :stores
	  resources :store_sku_line_items
	end
end