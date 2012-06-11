Taurus::Admin::BrandsController.class_eval do
  load_and_authorize_resource :class => "Taurus::Brand"
end
