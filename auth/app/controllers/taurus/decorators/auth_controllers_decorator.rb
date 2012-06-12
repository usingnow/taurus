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

Taurus::Admin::IndustriesController.class_eval do
  load_and_authorize_resource :class => "Taurus::Industry"
end

Taurus::Admin::CompanyTypesController.class_eval do
  load_and_authorize_resource :class => "Taurus::CompanyType"
end

Taurus::Admin::CompanyScalesController.class_eval do
  load_and_authorize_resource :class => "Taurus::CompanyScale"
end

Taurus::Admin::AlipaysController.class_eval do
  load_and_authorize_resource :class => "Taurus::Alipay"
end

if defined?(Taurus::Warehouse)
  Taurus::Admin::StoreSkuLineItemsController.class_eval do
    load_and_authorize_resource :class => "Taurus::StoreSkuLineItem"
  end

  Taurus::Admin::ReplenishmentRecordsController.class_eval do
    load_and_authorize_resource :class => "Taurus::ReplenishmentRecord"
  end

  Taurus::Admin::DeliveryRecordsController.class_eval do
    load_and_authorize_resource :class => "Taurus::DeliveryRecord"
  end

  Taurus::Admin::OrderDeliveryRecordsController.class_eval do
    load_and_authorize_resource :class => "Taurus::DeliveryRecord"
  end
end

if defined?(Taurus::Cms)
  Taurus::Admin::SliderBarsController.class_eval do
    load_and_authorize_resource :class => "Taurus::SliderBar"
  end

  Taurus::Admin::ProductDisplaysController.class_eval do
    load_and_authorize_resource :class => "Taurus::ProductDisplay"
  end
end

Taurus::Admin::CompanyExtendsController.class_eval do
  load_and_authorize_resource :class => "Taurus::CompanyExtend"
end

Taurus::Admin::PersonExtendsController.class_eval do
  load_and_authorize_resource :class => "Taurus::PersonExtend"
end

Taurus::Admin::RolesController.class_eval do
  load_and_authorize_resource :class => "Taurus::Role"
end

Taurus::Admin::AdministratorsController.class_eval do
  load_and_authorize_resource :class => "Taurus::Administrator"
end

Taurus::Admin::AdministratorGroupLineItemsController.class_eval do
  load_and_authorize_resource :class => "Taurus::AdministratorGroupLineItem"
end

Taurus::Admin::GroupsController.class_eval do
  load_and_authorize_resource :class => "Taurus::Group"
end

Taurus::Admin::PermissionsController.class_eval do
  load_and_authorize_resource :class => "Taurus::Permission"
end