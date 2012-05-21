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
    resources :skus do 
       collection do
         get :autocomplete_product_category_name
         get :autocomplete_brand_chinese_name 
         get :autocomplete_supplier_name
       end
       member do
         get :clone
       end
    end
    resources :products do
      get :autocomplete_product_category_name, :on => :collection
      member do
        get :edit_sales_status
        put :update_sales_status
      end
      resources :custom_property_values
      resources :product_sku_line_items do 
        get :autocomplete_sku_name, :on => :collection
        member do
          get :show_sku
          get :add_product_sku
        end
      end
      resources :product_images
    end
  end

  namespace :index do 
    resources :home
    resources :cart_product_line_items
    resources :orders do
      resources :order_product_line_items
      resources :order_payments
      resources :order_deliveries
    end
  end

  match '/admin', :to => 'admin/functions#index'
  root :to => 'index/home#index' 

	
end