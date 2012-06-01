Taurus::Core::Engine.routes.draw do 
  namespace :admin do
    resources :promotions do
      resources :promotion_rules
      collection do 
        get :autocomplete_user_email
      end
      member do 
        get :add_user
      end
    end
  end
end