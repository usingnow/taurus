Taurus::Admin::SuppliersController.class_eval do
  load_and_authorize_resource :class => "Taurus::Supplier"
end

Taurus::Admin::BrandsController.class_eval do
  load_and_authorize_resource :class => "Taurus::Brand"
end

Taurus::Admin::ProductCategoriesController.class_eval do
  load_and_authorize_resource :class => "Taurus::ProductCategory"
end

Taurus::Admin::SkusController.class_eval do
  load_and_authorize_resource :class => "Taurus::Sku"
end

Taurus::Admin::ProductsController.class_eval do
  load_and_authorize_resource :class => "Taurus::Product"
end

Taurus::Admin::OrdersController.class_eval do
  load_and_authorize_resource :class => "Taurus::Order"
end

Taurus::Admin::StoreSkuLineItemsController.class_eval do
  load_and_authorize_resource :class => "Taurus::StoreSkuLineItem"
end
