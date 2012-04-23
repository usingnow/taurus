Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Taurus::Cms::Engine => '/'


  devise_for :administrators,
             :path => "back",
             :controllers => { :sessions => "admin/devise/sessions",
                               :registrations => "admin/devise/registrations"  }

  devise_for :users,
             :path => "users",
             :controllers => { :sessions => "user/sessions",
                               :registrations => "user/registrations",
                               :passwords => "user/passwords" } do
    get "users/personal_sign_up" => "user/registrations#personal"
    post "users/personal_sign_up" => "user/registrations#create_personal"
    get "users/login_success" => "user/sessions#login_success"
  end

  resources :home do
    collection do
      get :who_am_i
      get :group_partner
      get :join_us
      get :media_report
      get :registration_help
      get :how_to_buy
      get :how_to_query_order
      get :deliver_area_help
      get :deliver_fee_help
      get :deliver_time_help
      get :payment_method_help
      get :monthly_check_help
      get :coupon_help
      get :refund_principle
      get :complaints_suggestion_help
      get :users_terms
      get :forget_password
      get :faq
      get :contact_sd
      get :pub_1
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
    resources :customer_ratings do
      put :close, :on => :member
    end
    resources :groups
    resources :home
    resources :industries
    resources :panic_buyings
    resources :permissions do
      member do
        get :procedure_new
        post :procedure_create
      end
    end
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
        get  :sign_in
        get  :take_over
      end
      member do
        get  :take_over_logs
        get  :order_tracks
        get  :show_delivery_note
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
    resources :ordering_companies
    resources :product_storeships
    resources :stores
    resources :product_store_entryships
    resources :store_entries do
      collection do
        get :purchase_orders
      end
      member do
        get :new_from_po
        post :create_from_po
      end
    end
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
        collection do
          get :search
        end
        member do
          put :update_status
        end
        resources :sku_on_shelves
      end
    end

    namespace :index do
      resources :skus
      resources :brands
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
    resources :sku_details do
      resources :customer_ratings
    end
  end

  namespace :content do
    namespace :index do
      resources :announcements
      resources :images
    end
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
        post :create_user_address
        get :show_user_address
      end
    end
    resources :back_order_news do
      collection do
        post :preview
      end
    end
    resources :back_order_skus do
      member do
        put :install
        put :assemble
      end
    end
    resources :order_prints
    resources :front_orders do
      collection do
        post :review
        get  :success
        post :operate
      end
    end
  end

  namespace :purchase do
    resources :po_product_lists do
      member do
        put :released_update
      end
    end
    resources :purchase_orders do
      collection do
        get :search_products
        get :search_products_edit
        get :preview
        get :check_supplier_id
      end
      member do
        put :release
        get :released_edit
        put :released_update
        get :print
      end
    end
    resources :po_product_temp_lists
  end

  namespace :user do
    resources :consignee_infos
    resources :user_addresses
    resources :user_centers do
      collection do
        get :mail_sales
        post :add_mail_sales
        get :user_addresses
        get :comments
        get :my_points
        get :my_favorites
        get :order_query
        get :order_edit
        get :new_user_address
        post :create_user_address
        get :detailed_p_user_info
        get :edit_p_user_info
        put :update_p_user_info
        get :detailed_e_user_info
        get :edit_e_user_info
        put :update_e_user_info
      end
      member do
        get :order_show
        get :edit_user_address
        put :update_user_address
        delete :del_user_address
        get :remit_payment_info
        post :add_remit_payment_info
        delete :cancel
      end
    end

    namespace :index do
      resources :favorites
      resources :subscribes
    end
  end

  namespace :promotion do
    resources :online_promotions do
      get :search_skus, :on => :collection
      member do
        put :release
        get :close_view
        put :close
        get :priorities
      end
      resources :promotion_priorities
    end
    resources :promotion_by_orders do
      post :preview, :on => :collection
    end
    resources :promotion_by_products do
      post :preview, :on => :collection
    end
    resources :promotion_member_temps
    resources :promotion_product_temps
  end




  root :to => 'home#index'

  match '/admin', :to => 'admin/home#index', :as => :admin

end
