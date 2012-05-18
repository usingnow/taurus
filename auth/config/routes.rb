Taurus::Core::Engine.routes.prepend do
  namespace :admin do
    resources :administrators
    resources :groups
    resources :roles
    resources :company_extends
    resources :person_extends
  end


  devise_for :administrator,
             :class_name => 'Taurus::Administrator',
             :controllers => { :sessions => 'taurus/admin/admin_sessions'},
             :path => "admin"

  devise_for :user,
             :class_name => 'Taurus::User',
             :controllers => { :registrations => 'taurus/index/user_registrations'},
             :path => "index"           
end