Taurus::Core::Engine.routes.draw do 
  mount Ckeditor::Engine => '/ckeditor'
  
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
    resources :product_categories do
      collection do 
        get :autocomplete_product_category_name
        get :autocomplete_combined_category_name
        get :combined_new
        post :combined_create
      end
      member do
        get :seconds
        get :thirds
        get :children
        get :edit_children
        get :edit_child
        put :update_child
        delete :destroy_child
        post :create_child
      end
      resources :custom_properties
    end
    resources :products do
      collection do 
        get :autocomplete_product_category_name
        get :autocomplete_combined_category_name
        get :combined_new
        post :combined_create
      end
      member do
        get :show_sales_status
        get :edit_sales_status
        get :new_sales_status
        put :update_sales_status
      end
      resources :custom_property_values
      resources :combined_products do
        get :autocomplete_product_name, :on => :collection
      end
      resources :product_images do
        put :set_up_main_img, :on => :member
      end
    end
    resources :orders do
      member do 
        get :relieve_reserved
        put :confirm_online_payment
        get :sign
        put :delivery_sign
        get :cancel
      end
      collection do
        get :all
        get :autocomplete_user_name
      end
      resources :order_deliveries
      resources :order_payments
      resources :order_product_line_items
    end
    resources :alipays

    namespace :my do
      resource :page
      resource :account
    end
  end

  namespace :index do 
    resources :home
    resources :cart_product_line_items
    resources :orders do
      member do 
        get :online_payment
        get :success
        delete :cancel
      end
      collection do 
        get :online_payment_notify
        get :online_payment_done
      end
      resources :order_product_line_items
      resources :order_payments
      resources :order_deliveries
    end
    resources :user_centers
    resources :products
  end

  match '/admin', :to => 'admin/home#index'
  match '/admin/all_orders', :to => 'admin/orders#all'
  match '/admin/all_orders/:id', :to => 'admin/orders#show'
  match '/admin/all_orders/:order_id/order_deliveries', :to => "admin/order_deliveries#index"
  match '/admin/all_orders/:order_id/order_payments', :to => "admin/order_payments#index"
  match '/admin/all_orders/:order_id/order_product_line_items', :to => "admin/order_product_line_items#index"
  match '/admin/all_orders/:id/edit', :to => "admin/orders#edit"
  match '/admin/all_orders/:order_id/order_deliveries/:id/edit', :to => "admin/order_deliveries#edit"
  match '/admin/all_orders/:order_id/order_payments/:id/edit', :to => "admin/order_payments#edit"
  root :to => 'index/home#index' 

	
end