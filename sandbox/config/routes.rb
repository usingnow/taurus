Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Taurus::Cms::Engine => '/'
  mount Taurus::Core::Engine => '/'
end
