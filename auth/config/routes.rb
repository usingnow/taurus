Taurus::Core::Engine.routes.draw do
  namespace :admin do
    resources :administrators do
      resources :administrator_group_line_items
    end
    resources :groups
    resources :roles
    resources :company_extends
    resources :person_extends
    resources :permissions
  end


  devise_for :administrator,
             :class_name => 'Taurus::Administrator',
             :controllers => { :sessions => 'taurus/admin/admin_sessions'},
             :path => "admin"

  devise_for :user,
             :class_name => 'Taurus::User',
             :controllers => { 
               :registrations => 'taurus/index/user_registrations',
               :sessions => 'taurus/index/user_sessions'
             },
             :path => "index"

  devise_scope :user do
    get '/index/company_sign_up' => 'index/user_registrations#new_company'
    post '/index/company_sign_up' => 'index/user_registrations#create_company'
  end            

end