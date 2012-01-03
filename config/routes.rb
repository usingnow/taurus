Ebiz::Application.routes.draw do

  resources :banks

  devise_for :administrators,
             :path =>"admin",
             :controllers => { :sessions => "admin/devise/sessions",
                               :registrations => "admin/devise/registrations"  }
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
   namespace :admin do
     resources :administrators
     resources :products do
       collection do
         get  :search
       end
     end
     resources :suppliers
     resources :brands
     resources :product_categories
     resources :sku_categories
     resources :skus do
       collection do
         get  :add
       end
     end
     resources :sku_productships
     resources :sku_images
     resources :orders do
       collection do
         get  :take_over
         get  :cancel
         get  :paid
         post  :condition
         get  :output
         get  :sign_in
         get  :input_pay_info
         post :step1
         get  :step2
         get  :step3
       end
     end
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
     resources :purchases
     resources :ordering_companies
     resources :product_storeships
     resources :stores
     resources :product_store_entryships
     resources :store_entries
     resources :store_entry_product_carts
     resources :pick_ups
   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index', :as => 'home'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id(.:format)))'
  match '/admin', :to => 'admin/orders#index', :as => :admin
end
