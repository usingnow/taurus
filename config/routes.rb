Ebiz::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :administrators,
             :path => "back",
             :controllers => { :sessions => "admin/devise/sessions",
                               :registrations => "admin/devise/registrations"  }

  devise_for :users,
             :path => "users",
             :controllers => { :sessions => "user/sessions",
                               :registrations => "user/registrations"} do
    get "users/personal_sign_up" => "user/registrations#personal"
    post "users/personal_sign_up" => "user/registrations#create_personal"
    get "users/login_success" => "user/sessions#login_success"
  end


  resources :home do
    collection do
      get :who_am_i
    end
  end
  resources :codes

  resources :alipaies do
    collection do
      get :notify
      get :done
    end
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
    resources :banks
    resources :inner_sku_carts
    resources :prod_del_ordships
  end


  namespace :cart do
    resources :cart_skuships do
      collection do
        get :current_skus
        delete :empty
      end
    end
  end

  namespace :commodity do
    namespace :admin do
      resources :skus do
        resources :sku_on_shelves
        collection do
          get  :add
          get  :search
        end
      end
    end

    namespace :index do
      resources :skus
    end

    resources :categories do
      collection do
        get :oa_pc
        get :office
        get :daily
        get :off_fur
        get :liv_fur
        get :fur_jew
      end
    end
    resources :sku_details
    resources :sku_displays
  end

  namespace :content do
    resources :announcements
    resources :images
    resources :slider_bars
  end

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
    resources :front_orders do
      collection do
        post :review
        get  :success
      end
    end
  end

  namespace :user do
    resources :consignee_infos
    resources :user_addresses
    resources :user_centers do
      collection do
        get :detailed_p_user_info
        get :detailed_e_user_info
        get :mail_sales
        get :user_addresses
        get :comments
        get :my_points
        get :my_favorites
        get :order_query
        get :order_edit
        get :new_user_address
        get :edit_p_user_info
        get :edit_e_user_info
      end
      member do
        get :order_show
        get :edit_user_address
        delete :del_user_address
        get :remit_payment_info
      end
    end
  end


  root :to => 'home#index'

  match '/admin', :to => 'admin/home#index', :as => :admin
end
