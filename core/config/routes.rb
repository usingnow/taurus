Taurus::Core::Engine.routes.draw do 
  resources :areas do 
    collection do 
      get :cities
      get :districts
    end
  end    

  namespace :admin do 
    resources :industries
    resources :company_types
    resources :company_scales
    resources :suppliers
    resources :brands
  end

  match '/admin', :to => 'admin/home#index'
	
end