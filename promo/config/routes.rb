Taurus::Core::Engine.routes.draw do 
  namespace :admin do
    resources :promotions do
      collection do 
        get :autocomplete_user_email
        get :autocomplete_role_name
        get :autocomplete_product_category_name
      end
      member do 
        get :add_user
        get :add_role
        get :add_category
      end
      
      resources :promotion_rules
      resources :promotion_actions
    end
  end
end