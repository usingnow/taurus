#encoding:UTF-8
# RailsAdmin config file. Generated on February 01, 2012 17:10
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_administrator } # auto-generated


  # If you want to track changes on your models:
  # config.audit_with :history, Administrator
  
  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, Administrator
  
  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['壹美壹家', '电子商务后台管理系统']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Administrator, AdministratorGroupship, BackOrderSku, Bank, Brand, BusinessFunction, Cart, CartSkuship, City, Ckeditor::Asset, Ckeditor::AttachmentFile, Ckeditor::Picture, CompanyExtend, CompanyScale, CompanyType, Component, Condition, DeliveryOrder, DeliveryOrderCart, District, Esc, EscCategory, EscReply, Function, Group, Industry, InnerOrderAddress, InnerOrderPayment, Instance, Operating, Order, OrderDetail, OrderNumber, OrderPay, OrderPrintLog, OrderTakeLog, OrderTrack, OrderingCompany, PanicBuying, Permission, PersonExtend, Procedure, ProcedureRoleship, ProdDelOrdship, Product, ProductCategory, ProductPurchaseship, ProductStoreEntryship, ProductStoreship, Province, Purchase, RecAdd, Role, SerialNumber, Sku, SkuCategory, SkuImage, SkuProductship, SliderBar, Station, StationProcedureship, Store, StoreEntry, StoreEntryProductCart, Supplier, System, Track, User, UserNumber]

  # Add models here if you want to go 'whitelist mode':
  config.included_models = [Supplier,Brand,ProductCategory,Product,SkuCategory,Sku]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Administrator do
  #   # Found associations:
  #     configure :administrator_groupships, :has_many_association 
  #     configure :groups, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :login_no, :string 
  #     configure :status, :integer 
  #     configure :name, :string 
  #     configure :address, :string 
  #     configure :phone, :string 
  #     configure :fax, :string 
  #     configure :mobile, :string 
  #     configure :zip, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model AdministratorGroupship do
  #   # Found associations:
  #     configure :administrator, :belongs_to_association 
  #     configure :group, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :administrator_id, :integer         # Hidden 
  #     configure :group_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model BackOrderSku do
  #   # Found associations:
  #     configure :sku, :belongs_to_association 
  #     configure :user, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :sku_id, :integer         # Hidden 
  #     configure :quantity, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :user_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Bank do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :account_no, :string 
  #     configure :name, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Brand do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :chinese_name, :string 
  #     configure :english_name, :string 
  #     configure :pinyin, :string 
  #     configure :web_address, :string 
  #     configure :active, :integer 
  #     configure :create_by, :string 
  #     configure :update_by, :string 
  #     configure :company_name, :string 
  #     configure :company_introduction, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :image_file_name, :string         # Hidden 
  #     configure :image_content_type, :string         # Hidden 
  #     configure :image_file_size, :integer         # Hidden 
  #     configure :image_updated_at, :datetime         # Hidden 
  #     configure :image, :paperclip   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model BusinessFunction do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :function, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Cart do
  #   # Found associations:
  #     configure :cart_skuships, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model CartSkuship do
  #   # Found associations:
  #     configure :sku, :belongs_to_association 
  #     configure :cart, :belongs_to_association 
  #     configure :order, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :sku_id, :integer         # Hidden 
  #     configure :cart_id, :integer         # Hidden 
  #     configure :quantity, :integer 
  #     configure :order_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model City do
  #   # Found associations:
  #     configure :province, :belongs_to_association 
  #     configure :districts, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :province_no, :integer         # Hidden 
  #     configure :name, :string 
  #     configure :number, :string 
  #     configure :free_shipping_limit, :integer 
  #     configure :precision, :integer 
  #     configure :shipping_fee, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Ckeditor::Asset do
  #   # Found associations:
  #     configure :assetable, :polymorphic_association         # Hidden   #   # Found columns:
  #     configure :id, :integer 
  #     configure :data_file_name, :string 
  #     configure :data_content_type, :string 
  #     configure :data_file_size, :integer 
  #     configure :assetable_id, :integer         # Hidden 
  #     configure :assetable_type, :string         # Hidden 
  #     configure :type, :string 
  #     configure :guid, :string 
  #     configure :locale, :integer 
  #     configure :user_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Ckeditor::AttachmentFile do
  #   # Found associations:
  #     configure :assetable, :polymorphic_association         # Hidden   #   # Found columns:
  #     configure :id, :integer 
  #     configure :data_file_name, :string         # Hidden 
  #     configure :data_content_type, :string         # Hidden 
  #     configure :data_file_size, :integer         # Hidden 
  #     configure :data, :paperclip 
  #     configure :assetable_id, :integer         # Hidden 
  #     configure :assetable_type, :string         # Hidden 
  #     configure :type, :string 
  #     configure :guid, :string 
  #     configure :locale, :integer 
  #     configure :user_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Ckeditor::Picture do
  #   # Found associations:
  #     configure :assetable, :polymorphic_association         # Hidden   #   # Found columns:
  #     configure :id, :integer 
  #     configure :data_file_name, :string         # Hidden 
  #     configure :data_content_type, :string         # Hidden 
  #     configure :data_file_size, :integer         # Hidden 
  #     configure :data, :paperclip 
  #     configure :assetable_id, :integer         # Hidden 
  #     configure :assetable_type, :string         # Hidden 
  #     configure :type, :string 
  #     configure :guid, :string 
  #     configure :locale, :integer 
  #     configure :user_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model CompanyExtend do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :industry, :belongs_to_association 
  #     configure :company_type, :belongs_to_association 
  #     configure :district, :belongs_to_association 
  #     configure :company_scale, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :company_no, :string 
  #     configure :industry_id, :integer         # Hidden 
  #     configure :company_type_id, :integer         # Hidden 
  #     configure :district_no, :string         # Hidden 
  #     configure :company_scale_id, :integer         # Hidden 
  #     configure :email, :string 
  #     configure :company_name, :string 
  #     configure :contact_dept, :string 
  #     configure :contact_post, :string 
  #     configure :web_address, :string 
  #     configure :sex, :integer 
  #     configure :name, :string 
  #     configure :address, :string 
  #     configure :phone, :string 
  #     configure :fax, :string 
  #     configure :mobile, :string 
  #     configure :zip, :string 
  #     configure :created_by, :string 
  #     configure :updated_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model CompanyScale do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :sequence, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model CompanyType do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :sequence, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Component do
  #   # Found associations:
  #     configure :functions, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :system_id, :integer 
  #     configure :name, :string 
  #     configure :description, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Condition do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :condition_type, :integer 
  #     configure :action, :string 
  #     configure :display_name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model DeliveryOrder do
  #   # Found associations:
  #     configure :order, :belongs_to_association 
  #     configure :store, :belongs_to_association 
  #     configure :administrator, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :order_id, :integer         # Hidden 
  #     configure :store_id, :integer         # Hidden 
  #     configure :administrator_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :number, :string 
  #     configure :line_type, :integer 
  #     configure :name, :string 
  #     configure :phone, :string 
  #     configure :waybill_number, :string 
  #     configure :delivery_date, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model DeliveryOrderCart do
  #   # Found associations:
  #     configure :product, :belongs_to_association 
  #     configure :administrator, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :product_id, :integer         # Hidden 
  #     configure :quantity, :integer 
  #     configure :administrator_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model District do
  #   # Found associations:
  #     configure :city, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :city_no, :integer         # Hidden 
  #     configure :name, :string 
  #     configure :number, :string 
  #     configure :free_shipping_limit, :integer 
  #     configure :precision, :integer 
  #     configure :shipping_fee, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Esc do
  #   # Found associations:
  #     configure :esc_category, :belongs_to_association 
  #     configure :user, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :esc_category_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :status, :integer 
  #     configure :order_id, :integer 
  #     configure :not_registration_user_info, :string 
  #     configure :user_other_info, :string 
  #     configure :title, :string 
  #     configure :description, :text 
  #     configure :created_by, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model EscCategory do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :sequence, :integer 
  #     configure :active, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model EscReply do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :esc_id, :integer 
  #     configure :replier, :integer 
  #     configure :content, :text 
  #     configure :status_changed_info, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Function do
  #   # Found associations:
  #     configure :component, :belongs_to_association 
  #     configure :operatings, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :component_id, :integer         # Hidden 
  #     configure :name, :string 
  #     configure :description, :string 
  #     configure :url, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Group do
  #   # Found associations:
  #     configure :permissions, :has_many_association 
  #     configure :operatings, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :name, :string 
  #     configure :desc, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Industry do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :sequence, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model InnerOrderAddress do
  #   # Found associations:
  #     configure :district, :belongs_to_association 
  #     configure :user, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :district_no, :string         # Hidden 
  #     configure :address, :string 
  #     configure :phone, :string 
  #     configure :mobile, :string 
  #     configure :email, :string 
  #     configure :zip, :string 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model InnerOrderPayment do
  #   # Found associations:
  #     configure :procedure, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :procedure_id, :integer         # Hidden 
  #     configure :invoice_type, :integer 
  #     configure :account_bank, :string 
  #     configure :account_person_name, :string 
  #     configure :account_phone, :string 
  #     configure :account_no, :string 
  #     configure :added_value_tax_no, :string 
  #     configure :account_reg_add, :string 
  #     configure :is_invoice_head, :integer 
  #     configure :company_name, :string 
  #     configure :user_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Instance do
  #   # Found associations:
  #     configure :station, :belongs_to_association 
  #     configure :procedure, :belongs_to_association 
  #     configure :tracks, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :station_id, :integer         # Hidden 
  #     configure :procedure_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Operating do
  #   # Found associations:
  #     configure :function, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :function_id, :integer         # Hidden 
  #     configure :name, :string 
  #     configure :description, :string 
  #     configure :action, :string 
  #     configure :subject_class, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Order do
  #   # Found associations:
  #     configure :instance, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :administrator, :belongs_to_association 
  #     configure :make_administrator, :belongs_to_association 
  #     configure :district, :belongs_to_association 
  #     configure :order_details, :has_many_association 
  #     configure :order_pay, :has_one_association 
  #     configure :order_take_logs, :has_many_association 
  #     configure :skus, :has_many_association 
  #     configure :order_print_logs, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :batch, :string 
  #     configure :expect_date, :datetime 
  #     configure :instance_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :take_admin_id, :integer         # Hidden 
  #     configure :created_admin_id, :integer         # Hidden 
  #     configure :updated_admin_id, :integer 
  #     configure :customer_note, :text 
  #     configure :inner_note, :text 
  #     configure :reserve_reason, :text 
  #     configure :other_cost, :decimal 
  #     configure :is_affect_details, :integer 
  #     configure :district_no, :string         # Hidden 
  #     configure :name, :string 
  #     configure :address, :string 
  #     configure :zip, :string 
  #     configure :phone, :string 
  #     configure :mobile, :string 
  #     configure :email, :string 
  #     configure :carriage_cost, :decimal 
  #     configure :invoice_type, :integer 
  #     configure :account_bank, :string 
  #     configure :account_person_name, :string 
  #     configure :account_no, :string 
  #     configure :account_phone, :string 
  #     configure :added_value_tax_no, :string 
  #     configure :account_reg_add, :string 
  #     configure :is_invoice_head, :integer 
  #     configure :company_name, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :is_delivery, :boolean 
  #     configure :total_price, :decimal 
  #     configure :carriage_adjustment, :decimal   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model OrderDetail do
  #   # Found associations:
  #     configure :order, :belongs_to_association 
  #     configure :sku, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :order_id, :integer         # Hidden 
  #     configure :sku_id, :integer         # Hidden 
  #     configure :unit_price, :decimal 
  #     configure :quantity, :integer 
  #     configure :is_need_install, :integer 
  #     configure :install_cost, :decimal 
  #     configure :is_need_assemble, :integer 
  #     configure :assemble_cost, :decimal 
  #     configure :other_cost, :decimal 
  #     configure :created_admin_id, :integer 
  #     configure :updated_admin_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model OrderNumber do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :date, :date 
  #     configure :seq, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model OrderPay do
  #   # Found associations:
  #     configure :order, :belongs_to_association 
  #     configure :province, :belongs_to_association 
  #     configure :bank, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :order_id, :integer         # Hidden 
  #     configure :procedure_id, :integer 
  #     configure :buyer_alipay_no, :string 
  #     configure :alipay_date, :datetime 
  #     configure :alipay_no, :string 
  #     configure :alipay_price, :decimal 
  #     configure :province_no, :string         # Hidden 
  #     configure :remittance_no, :string 
  #     configure :price, :decimal 
  #     configure :pay_date, :datetime 
  #     configure :pay_bank, :string 
  #     configure :remitter, :string 
  #     configure :note, :string 
  #     configure :bank_id, :integer         # Hidden 
  #     configure :status, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model OrderPrintLog do
  #   # Found associations:
  #     configure :order, :belongs_to_association 
  #     configure :administrator, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :order_id, :integer         # Hidden 
  #     configure :administrator_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model OrderTakeLog do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :order_id, :integer 
  #     configure :oper_type, :integer 
  #     configure :created_by, :string 
  #     configure :administrator_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model OrderTrack do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :order_id, :integer 
  #     configure :is_display, :boolean 
  #     configure :description, :string 
  #     configure :created_by, :string 
  #     configure :admin_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model OrderingCompany do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :name, :string 
  #     configure :address, :string 
  #     configure :phone, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :active, :boolean   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model PanicBuying do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :href, :string 
  #     configure :image_file_name, :string         # Hidden 
  #     configure :image_content_type, :string         # Hidden 
  #     configure :image_file_size, :integer         # Hidden 
  #     configure :image_updated_at, :datetime         # Hidden 
  #     configure :image, :paperclip   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Permission do
  #   # Found associations:
  #     configure :group, :belongs_to_association 
  #     configure :operating, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :group_id, :integer         # Hidden 
  #     configure :operating_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model PersonExtend do
  #   # Found associations:
  #     configure :user, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :person_no, :string 
  #     configure :email, :string 
  #     configure :name, :string 
  #     configure :sex, :integer 
  #     configure :birth, :date 
  #     configure :district_no, :string 
  #     configure :phone, :string 
  #     configure :address, :string 
  #     configure :post, :string 
  #     configure :created_by, :string 
  #     configure :updated_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Procedure do
  #   # Found associations:
  #     configure :station_procedureships, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :display_name, :string 
  #     configure :active, :boolean 
  #     configure :sequence, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model ProcedureRoleship do
  #   # Found associations:
  #     configure :procedure, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :procedure_id, :integer         # Hidden 
  #     configure :role_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model ProdDelOrdship do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :delivery_order_id, :integer 
  #     configure :product_id, :integer 
  #     configure :quantity, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Product do
  #   # Found associations:
  #     configure :product_storeships, :belongs_to_association 
  #     configure :brand, :belongs_to_association 
  #     configure :product_category, :belongs_to_association 
  #     configure :supplier, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :product_id, :string         # Hidden 
  #     configure :name, :string 
  #     configure :cost_bef_tax, :decimal 
  #     configure :cost_aft_tax, :decimal 
  #     configure :brand_id, :string         # Hidden 
  #     configure :product_category_id, :string         # Hidden 
  #     configure :unit, :string 
  #     configure :specification, :string 
  #     configure :delivery_days, :integer 
  #     configure :line_type, :integer 
  #     configure :model, :string 
  #     configure :size, :string 
  #     configure :delivery_descprition, :string 
  #     configure :description, :text 
  #     configure :color, :string 
  #     configure :can_on_behalf, :boolean 
  #     configure :barcode, :string 
  #     configure :supplier_id, :string         # Hidden 
  #     configure :manufacturer, :string 
  #     configure :have_shelf_life, :boolean 
  #     configure :shelf_life, :integer 
  #     configure :have_wanrranty, :boolean 
  #     configure :wanrranty, :integer 
  #     configure :wanrranty_description, :text 
  #     configure :origin, :string 
  #     configure :appendant, :string 
  #     configure :is_green, :boolean 
  #     configure :is_assembling_required, :boolean 
  #     configure :assembling_fee_bef_tax, :decimal 
  #     configure :assembling_fee_aft_tax, :decimal 
  #     configure :is_maintanable, :boolean 
  #     configure :maintenance_cost_bef_tax, :decimal 
  #     configure :maintenance_cost_aft_tax, :decimal 
  #     configure :is_installation_required, :boolean 
  #     configure :installation_cost_bef_tax, :decimal 
  #     configure :insatllation_cost_aft_tax, :decimal 
  #     configure :created_by, :string 
  #     configure :updated_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model ProductCategory do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :parent_id, :integer 
  #     configure :number, :string 
  #     configure :name, :string 
  #     configure :description, :text 
  #     configure :create_by, :string 
  #     configure :update_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :sequence, :integer 
  #     configure :level, :integer 
  #     configure :active, :boolean   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model ProductPurchaseship do
  #   # Found associations:
  #     configure :product, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :product_id, :integer         # Hidden 
  #     configure :purchase_id, :integer 
  #     configure :quantity, :integer 
  #     configure :unit_price_aft_tax, :integer 
  #     configure :total_amount, :integer 
  #     configure :delivery_date, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model ProductStoreEntryship do
  #   # Found associations:
  #     configure :store_entry, :belongs_to_association 
  #     configure :product, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :store_entry_id, :integer         # Hidden 
  #     configure :product_id, :integer         # Hidden 
  #     configure :quantity, :integer 
  #     configure :delivery_date, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model ProductStoreship do
  #   # Found associations:
  #     configure :store, :belongs_to_association 
  #     configure :product, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :store_id, :integer         # Hidden 
  #     configure :product_id, :integer         # Hidden 
  #     configure :quantity, :integer 
  #     configure :stockout, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :sales_reserved, :integer   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Province do
  #   # Found associations:
  #     configure :cities, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :name, :string 
  #     configure :free_shipping_limit, :decimal 
  #     configure :shipping_fee, :integer 
  #     configure :precision, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Purchase do
  #   # Found associations:
  #     configure :ordering_company, :belongs_to_association 
  #     configure :supplier, :belongs_to_association 
  #     configure :product_purchaseships, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :ordering_company_id, :integer         # Hidden 
  #     configure :status, :integer 
  #     configure :note, :text 
  #     configure :supplier_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model RecAdd do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer 
  #     configure :district_no, :string 
  #     configure :name, :string 
  #     configure :address, :string 
  #     configure :zip, :string 
  #     configure :phone, :string 
  #     configure :mobile, :string 
  #     configure :email, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Role do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :name, :string 
  #     configure :description, :string 
  #     configure :is_reserve, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model SerialNumber do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :date, :string 
  #     configure :sequence, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  config.model Sku do
  #   # Found associations:
  #     configure :brand, :belongs_to_association 
  #     configure :sku_category, :belongs_to_association 
  #     configure :sku_images, :has_many_association 
  #     configure :sku_productships, :has_many_association 
  #     configure :products, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :name, :string 
  #     configure :brand_id, :integer         # Hidden 
  #     configure :sku_category_id, :integer         # Hidden 
  #     configure :unit, :string 
  #     configure :specification, :string 
  #     configure :delivery_day, :string 
  #     configure :sku_type, :integer 
  #     configure :model, :string 
  #     configure :size, :string 
  #     configure :delivery_description, :text 
  #     configure :can_return, :boolean 
  #     configure :description, :text 
  #     configure :color, :string 
  #     configure :can_on_be_half, :boolean 
  #     configure :classifcation, :integer 
  #     configure :is_integral, :boolean 
  #     configure :integral, :integer 
  #     configure :introduction, :text 
  #     configure :advertisement, :text 
  #     configure :status, :integer 
  #     configure :sales_status, :integer 
  #     configure :cost_bef_tax, :decimal 
  #     configure :cost_aft_tax, :decimal 
  #     configure :market_price, :decimal 
  #     configure :assembling_fee_bef_tax, :decimal 
  #     configure :assembling_fee_aft_tax, :decimal 
  #     configure :installation_cost_bef_tax, :decimal 
  #     configure :insatllation_cost_aft_tax, :decimal 
  #     configure :create_by, :string 
  #     configure :update_by, :string 
  #     configure :total_sale, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
    list do
      field :number
      field :name
      field :sku_category
      field :unit
      field :sku_type do
        formatted_value do
          bindings[:view].format_sku_type value
        end
      end
      field :status do
        formatted_value do
          bindings[:view].format_sku_status value
        end
      end
      field :sales_status do
        formatted_value do
          bindings[:view].format_sku_sales_status value
        end
      end
      field :updated_at
    end
  #   export do; end
  #   show do; end
  #   edit do; end
    create do
      field :number
      field :name
      field :brand
    end
  #   update do; end
  end


  # config.model SkuCategory do
  #   # Found associations:
  #     configure :children, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :root_id, :integer 
  #     configure :parent_id, :integer         # Hidden 
  #     configure :number, :string 
  #     configure :name, :string 
  #     configure :description, :text 
  #     configure :is_show_in_navigation, :boolean 
  #     configure :is_show_in_column, :boolean 
  #     configure :active, :boolean 
  #     configure :create_by, :string 
  #     configure :update_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :sequence, :integer 
  #     configure :level, :integer   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model SkuImage do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :sku_id, :integer 
  #     configure :name, :string 
  #     configure :image_description, :text 
  #     configure :sort, :integer 
  #     configure :is_main, :boolean 
  #     configure :created_by, :string 
  #     configure :updated_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :image_file_name, :string         # Hidden 
  #     configure :image_content_type, :string         # Hidden 
  #     configure :image_file_size, :integer         # Hidden 
  #     configure :image_updated_at, :datetime         # Hidden 
  #     configure :image, :paperclip 
  #     configure :media_id, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model SkuProductship do
  #   # Found associations:
  #     configure :product, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :sku_id, :integer 
  #     configure :product_id, :integer         # Hidden 
  #     configure :package_name, :string 
  #     configure :package_num, :integer 
  #     configure :sales_bef_tax, :integer 
  #     configure :sales_aft_tax, :integer 
  #     configure :is_main, :boolean 
  #     configure :created_by, :string 
  #     configure :updated_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :media_id, :string 
  #     configure :Material_id, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model SliderBar do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :href, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :image_file_name, :string         # Hidden 
  #     configure :image_content_type, :string         # Hidden 
  #     configure :image_file_size, :integer         # Hidden 
  #     configure :image_updated_at, :datetime         # Hidden 
  #     configure :image, :paperclip   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Station do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :display_name, :string 
  #     configure :condition_function, :string 
  #     configure :business_function, :string 
  #     configure :station_type, :integer 
  #     configure :sequence, :integer 
  #     configure :safe_quantity, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model StationProcedureship do
  #   # Found associations:
  #     configure :station, :belongs_to_association 
  #     configure :condition, :belongs_to_association 
  #     configure :next_station, :belongs_to_association 
  #     configure :business_function, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :procedure_id, :integer 
  #     configure :station_id, :integer         # Hidden 
  #     configure :condition_id, :integer         # Hidden 
  #     configure :next_station_id, :integer         # Hidden 
  #     configure :business_function_id, :integer         # Hidden 
  #     configure :operate_url, :string 
  #     configure :target, :string 
  #     configure :width, :integer 
  #     configure :height, :integer 
  #     configure :active, :boolean 
  #     configure :sequence, :integer 
  #     configure :sub_sequence, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Store do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :description, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model StoreEntry do
  #   # Found associations:
  #     configure :purchase, :belongs_to_association 
  #     configure :ordering_company, :belongs_to_association 
  #     configure :supplier, :belongs_to_association 
  #     configure :store, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :number, :string 
  #     configure :purchase_id, :integer         # Hidden 
  #     configure :ordering_company_id, :integer         # Hidden 
  #     configure :supplier_id, :integer         # Hidden 
  #     configure :store_id, :integer         # Hidden 
  #     configure :note, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model StoreEntryProductCart do
  #   # Found associations:
  #     configure :product, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :product_id, :integer         # Hidden 
  #     configure :quantity, :integer 
  #     configure :delivery_date, :date 
  #     configure :unit_price_aft_tax, :decimal 
  #     configure :total_amount, :decimal 
  #     configure :admin_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :cart_type, :integer   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  config.model Supplier do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :input_person, :string 
  #     configure :contact_name, :string 
  #     configure :contact_way, :string 
  #     configure :terms_of_exchange, :string 
  #     configure :delivery, :string 
  #     configure :level, :string 
  #     configure :active, :integer 
  #     configure :create_by, :string 
  #     configure :update_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
    list do
      field :name
      field :input_person
      field :updated_at
    end
  #   export do; end
  #   show do; end
  #   edit do; end
    create do
      field :name
      field :input_person
      field :contact_name
      field :contact_way
      field :terms_of_exchange
      field :delivery
      field :level
      field :active do
        partial :radio_input
      end
    end
  #   update do; end
  end
  # config.model System do
  #   # Found associations:
  #     configure :components, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :description, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Track do
  #   # Found associations:
  #     configure :station, :belongs_to_association 
  #     configure :condition, :belongs_to_association 
  #     configure :next_station, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :instance_id, :integer 
  #     configure :station_id, :integer         # Hidden 
  #     configure :condition_id, :integer         # Hidden 
  #     configure :next_station_id, :integer         # Hidden 
  #     configure :created_by, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #     configure :role, :belongs_to_association 
  #     configure :store, :belongs_to_association 
  #     configure :person_extend, :has_one_association 
  #     configure :company_extend, :has_one_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :login_no, :string 
  #     configure :role_id, :integer         # Hidden 
  #     configure :status, :integer 
  #     configure :user_type, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :store_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model UserNumber do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :person_no, :integer 
  #     configure :company_no, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
