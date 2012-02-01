Ebiz::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users,
             :controllers => { :sessions => "user/sessions",
                               :registrations => "user/registrations"}

  devise_for :administrators,
             :path =>"admin",
             :controllers => { :sessions => "admin/devise/sessions",
                               :registrations => "admin/devise/registrations"  }

  #mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # The priority is based upon orders of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resources :home
  resources :cart_skuships
  resources :carts
  resources :orders
  resources :order_details
  resources :users do
    collection do
      get  :registration
      get  :person_reg
      get  :company_reg
      get  :login
      get  :sign_out
      post :person_enroll
      post :company_enroll
      post :sign_in
    end
  end
  resources :company_extends
  resources :person_extends
  resources :codes
  resources :alipay do
    collection do
      get :notify
      get :done
    end
  end


  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  namespace :store do
    resources :delivery_orders
    resources :sales_order_deliveries
  end

  namespace :order do
    resources :back_orders do
      collection do
        get  :user
      end
      member do
        put  :internal_note
        put  :carriage_adjustment
        put  :other_cost
      end
    end
    resources :back_order_news do
      collection do
        post :preview
      end
    end
    resources :back_order_skus
    resources :order_prints
  end



   namespace :admin do
     resources :administrators
     resources :administrator_groupships
     resources :brands do
       get  :autocomplete_brand_chinese_name, :on => :collection
     end
     resources :company_extends
     resources :company_scales
     resources :company_types
     resources :groups
     resources :home
     resources :industries
     resources :panic_buyings
     resources :permissions
     resources :products do
       collection do
         get  :search
       end
     end
     resources :suppliers do
       get  :autocomplete_supplier_name, :on => :collection
     end
     resources :product_categories do
       collection do
         get  :autocomplete_product_category_name
         get  :check
       end
     end
     resources :sku_categories do
       collection do
         get  :autocomplete_sku_category_name
         get  :check
       end
     end
     resources :skus do
       collection do
         get  :add
         get  :search
       end
     end
     resources :sku_productships do
       collection do
         get  :search_products
       end
     end
     resources :sku_images
     resources :orders do
       collection do
         get  :all
         get  :cancel
         post :condition
         get  :input_pay_info
         get  :output
         get  :paid
         get  :pay_confirmation
         get  :print_delivery_note
         get  :relieve_retention
         get  :show_delivery_note
         get  :sign_in
         get  :take_over
       end
     end
     resources :order_details
     resources :order_pays
     resources :procedures
     resources :stations
     resources :station_procedureships
     resources :users
     resources :person_extends
     resources :roles
     resources :procedure_roleships
     resources :esc_replies
     resources :escs
     resources :cities do
       collection do
         get  :ajax
       end
     end
     resources :districts do
       collection do
         get  :ajax
       end
     end
     resources :product_purchaseships
     resources :purchases do
       collection do
         put  :next
         get  :be_store
       end
     end
     resources :ordering_companies
     resources :product_storeships
     resources :stores
     resources :product_store_entryships
     resources :store_entries
     resources :store_entry_product_carts
     resources :slider_bars
     resources :banks
     resources :inner_sku_carts
     resources :prod_del_ordships
   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index', :as => 'home'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id(.:format)))'
  match '/admin', :to => 'admin/home#index', :as => :admin
end
