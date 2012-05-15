Taurus::Core::Engine.routes.draw do 
  resources :areas do 
    collection do 
      get :cities
      get :districts
    end
  end    

  namespace :admin do 
    resources :home
    resources :functions
    resources :industries
    resources :company_types
    resources :company_scales
    resources :suppliers
    resources :brands
    resources :product_categories do
      member do
        get :seconds
        get :thirds
      end
      resources :custom_properties
    end
  end

  match '/admin', :to => 'admin/functions#index' 

	
end