Taurus::Core::Engine.routes.draw do
  namespace :admin do
    resources :administrators
    resources :groups
    resources :roles
    resources :company_extends
  end
end