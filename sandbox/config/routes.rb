Rails.application.routes.draw do
  #mount Ckeditor::Engine => '/ckeditor'
  mount Taurus::Core::Engine => '/'
  mount Taurus::Auth::Engine => '/'
  mount Taurus::Cms::Engine => '/'
end
