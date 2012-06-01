Rails.application.routes.draw do
  #mount Ckeditor::Engine => '/ckeditor'
  mount Taurus::Core::Engine => '/'
end
