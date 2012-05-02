Taurus::Core::Engine.routes.draw do
  namespace :admin do
    resources :administrators
    resources :groups
  end
end