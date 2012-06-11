Taurus::Admin::SuppliersController.class_eval do
  load_and_authorize_resource :class => "Taurus::Supplier"
end
