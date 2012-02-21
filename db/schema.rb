# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120220022156) do

  create_table "administrator_groupships", :force => true do |t|
    t.integer  "administrator_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administrators", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login_no"
    t.integer  "status"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "zip"
  end

  add_index "administrators", ["email"], :name => "index_administrators_on_email", :unique => true
  add_index "administrators", ["reset_password_token"], :name => "index_administrators_on_reset_password_token", :unique => true

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.string   "internal_title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "back_order_skus", :force => true do |t|
    t.integer  "sku_id"
    t.integer  "quantity",   :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "banks", :force => true do |t|
    t.string   "number"
    t.string   "account_no"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", :force => true do |t|
    t.string   "chinese_name"
    t.string   "english_name"
    t.string   "pinyin"
    t.string   "web_address"
    t.integer  "active"
    t.string   "create_by"
    t.string   "update_by"
    t.string   "company_name"
    t.text     "company_introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "business_functions", :force => true do |t|
    t.string   "name"
    t.string   "function"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_skuships", :force => true do |t|
    t.integer  "sku_id"
    t.integer  "cart_id"
    t.integer  "quantity",         :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_need_install"
    t.boolean  "is_need_assemble"
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.integer  "province_no"
    t.string   "name"
    t.string   "number"
    t.decimal  "free_shipping_limit", :precision => 10, :scale => 0
    t.decimal  "precision",           :precision => 10, :scale => 0
    t.decimal  "shipping_fee",        :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "company_extends", :force => true do |t|
    t.integer  "user_id"
    t.string   "company_no"
    t.integer  "industry_id"
    t.integer  "company_type_id"
    t.string   "district_no"
    t.integer  "company_scale_id"
    t.string   "email"
    t.string   "company_name"
    t.string   "contact_dept"
    t.string   "contact_post"
    t.string   "web_address"
    t.integer  "sex"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "zip"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_scales", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_types", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", :force => true do |t|
    t.integer  "system_id"
    t.string   "name"
    t.string   "description"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "conditions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "condition_type"
    t.string   "action"
    t.string   "display_name"
  end

  create_table "consignee_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "district_no"
    t.string   "address"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consignee_infos", ["user_id"], :name => "index_consignee_infos_on_user_id", :unique => true

  create_table "delivery_order_carts", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity",         :default => 1
    t.integer  "administrator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_orders", :force => true do |t|
    t.integer  "order_id"
    t.integer  "store_id"
    t.integer  "administrator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.integer  "line_type"
    t.string   "name"
    t.string   "phone"
    t.string   "waybill_number"
    t.datetime "delivery_date"
  end

  create_table "districts", :force => true do |t|
    t.integer  "city_no"
    t.string   "name"
    t.string   "number"
    t.decimal  "free_shipping_limit", :precision => 10, :scale => 0
    t.decimal  "precision",           :precision => 10, :scale => 0
    t.decimal  "shipping_fee",        :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "esc_categories", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "esc_replies", :force => true do |t|
    t.integer  "esc_id"
    t.integer  "replier"
    t.text     "content"
    t.string   "status_changed_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "escs", :force => true do |t|
    t.string   "number"
    t.integer  "esc_category_id"
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "order_id"
    t.string   "not_registration_user_info"
    t.string   "user_other_info"
    t.string   "title"
    t.text     "description"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", :force => true do |t|
    t.integer  "component_id"
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "page"
    t.integer  "location"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inner_order_addresses", :force => true do |t|
    t.string   "name"
    t.string   "district_no"
    t.string   "address"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "zip"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inner_order_payments", :force => true do |t|
    t.integer  "procedure_id"
    t.integer  "invoice_type"
    t.string   "account_bank"
    t.string   "account_person_name"
    t.string   "account_phone"
    t.string   "account_no"
    t.string   "added_value_tax_no"
    t.string   "account_reg_add"
    t.integer  "is_invoice_head"
    t.string   "company_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instances", :force => true do |t|
    t.integer  "station_id"
    t.integer  "procedure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operatings", :force => true do |t|
    t.integer  "function_id"
    t.string   "name"
    t.string   "description"
    t.string   "action"
    t.string   "subject_class"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "sku_id"
    t.decimal  "unit_price",       :precision => 8, :scale => 2, :default => 0.0
    t.integer  "quantity",                                       :default => 1
    t.integer  "is_need_install",                                :default => 0
    t.decimal  "install_cost",     :precision => 8, :scale => 2, :default => 0.0
    t.integer  "is_need_assemble",                               :default => 0
    t.decimal  "assemble_cost",    :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "other_cost",       :precision => 8, :scale => 2, :default => 0.0
    t.integer  "created_admin_id"
    t.integer  "updated_admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_numbers", :force => true do |t|
    t.date     "date"
    t.integer  "seq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_pays", :force => true do |t|
    t.integer  "order_id"
    t.integer  "procedure_id"
    t.string   "buyer_alipay_no"
    t.datetime "alipay_date"
    t.string   "alipay_no"
    t.decimal  "alipay_price",    :precision => 8, :scale => 2
    t.string   "province_no"
    t.string   "remittance_no"
    t.decimal  "price",           :precision => 8, :scale => 2
    t.datetime "pay_date"
    t.string   "pay_bank"
    t.string   "remitter"
    t.string   "note"
    t.integer  "bank_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_print_logs", :force => true do |t|
    t.integer  "order_id"
    t.integer  "administrator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_take_logs", :force => true do |t|
    t.integer  "order_id"
    t.integer  "oper_type"
    t.string   "created_by"
    t.integer  "administrator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_tracks", :force => true do |t|
    t.integer  "order_id"
    t.boolean  "is_display"
    t.string   "description"
    t.string   "created_by"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordering_companies", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "orders", :force => true do |t|
    t.string   "number"
    t.string   "batch"
    t.datetime "expect_date"
    t.integer  "instance_id"
    t.integer  "user_id"
    t.integer  "take_admin_id"
    t.integer  "created_admin_id"
    t.integer  "updated_admin_id"
    t.text     "customer_note"
    t.text     "inner_note"
    t.text     "reserve_reason"
    t.decimal  "other_cost",          :precision => 8, :scale => 2, :default => 0.0
    t.integer  "is_affect_details"
    t.string   "district_no"
    t.string   "name"
    t.string   "address"
    t.string   "zip"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.decimal  "carriage_cost",       :precision => 8, :scale => 2, :default => 0.0
    t.integer  "invoice_type"
    t.string   "account_bank"
    t.string   "account_person_name"
    t.string   "account_no"
    t.string   "account_phone"
    t.string   "added_value_tax_no"
    t.string   "account_reg_add"
    t.integer  "is_invoice_head"
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_delivery",                                       :default => false
    t.decimal  "total_price",         :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "carriage_adjustment", :precision => 8, :scale => 2, :default => 0.0
  end

  create_table "permissions", :force => true do |t|
    t.integer  "group_id"
    t.integer  "operating_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "person_extends", :force => true do |t|
    t.integer  "user_id"
    t.string   "person_no"
    t.string   "email"
    t.string   "name"
    t.integer  "sex"
    t.date     "birth"
    t.string   "district_no"
    t.string   "phone"
    t.string   "address"
    t.string   "post"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedure_roleships", :force => true do |t|
    t.integer  "procedure_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.boolean  "active"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prod_del_ordships", :force => true do |t|
    t.integer  "delivery_order_id"
    t.integer  "product_id"
    t.integer  "quantity",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_categories", :force => true do |t|
    t.integer  "parent_id"
    t.string   "number"
    t.string   "name"
    t.text     "description"
    t.string   "create_by"
    t.string   "update_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequence",    :default => 0
    t.integer  "level",       :default => 0
    t.boolean  "active",      :default => false
  end

  create_table "product_purchaseships", :force => true do |t|
    t.integer  "product_id"
    t.integer  "purchase_id"
    t.integer  "quantity"
    t.decimal  "unit_price_aft_tax", :precision => 10, :scale => 0
    t.decimal  "total_amount",       :precision => 10, :scale => 0
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_store_entryships", :force => true do |t|
    t.integer  "store_entry_id"
    t.integer  "product_id"
    t.integer  "quantity",       :default => 0
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_storeships", :force => true do |t|
    t.integer  "store_id"
    t.integer  "product_id"
    t.integer  "quantity",       :default => 0
    t.integer  "stockout",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sales_reserved", :default => 0
  end

  create_table "products", :force => true do |t|
    t.string   "product_id"
    t.string   "name"
    t.decimal  "cost_bef_tax",              :precision => 8, :scale => 2
    t.decimal  "cost_aft_tax",              :precision => 8, :scale => 2
    t.string   "brand_id"
    t.string   "product_category_id"
    t.string   "unit"
    t.string   "specification"
    t.integer  "delivery_days"
    t.integer  "line_type"
    t.string   "model"
    t.string   "size"
    t.string   "delivery_descprition"
    t.text     "description"
    t.string   "color"
    t.boolean  "can_on_behalf"
    t.string   "barcode"
    t.string   "supplier_id"
    t.string   "manufacturer"
    t.boolean  "have_shelf_life"
    t.integer  "shelf_life"
    t.boolean  "have_wanrranty"
    t.integer  "wanrranty"
    t.text     "wanrranty_description"
    t.string   "origin"
    t.string   "appendant"
    t.boolean  "is_green"
    t.boolean  "is_assembling_required"
    t.decimal  "assembling_fee_bef_tax",    :precision => 8, :scale => 2
    t.decimal  "assembling_fee_aft_tax",    :precision => 8, :scale => 2
    t.boolean  "is_maintanable"
    t.decimal  "maintenance_cost_bef_tax",  :precision => 8, :scale => 2
    t.decimal  "maintenance_cost_aft_tax",  :precision => 8, :scale => 2
    t.boolean  "is_installation_required"
    t.decimal  "installation_cost_bef_tax", :precision => 8, :scale => 2
    t.decimal  "insatllation_cost_aft_tax", :precision => 8, :scale => 2
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.decimal  "free_shipping_limit", :precision => 8,  :scale => 2
    t.decimal  "shipping_fee",        :precision => 10, :scale => 0
    t.decimal  "precision",           :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.string   "number"
    t.integer  "ordering_company_id"
    t.integer  "status"
    t.text     "note"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "description"
    t.boolean  "is_reserve"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "serial_numbers", :force => true do |t|
    t.string   "name"
    t.string   "date"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sku_categories", :force => true do |t|
    t.integer  "root_id"
    t.integer  "parent_id"
    t.string   "number"
    t.string   "name"
    t.text     "description"
    t.boolean  "is_show_in_navigation"
    t.boolean  "is_show_in_column"
    t.boolean  "active"
    t.string   "create_by"
    t.string   "update_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequence"
    t.integer  "level"
  end

  create_table "sku_displays", :force => true do |t|
    t.integer  "sku_id"
    t.integer  "sequence"
    t.integer  "page"
    t.integer  "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sku_images", :force => true do |t|
    t.integer  "sku_id"
    t.string   "name"
    t.text     "image_description"
    t.integer  "sort"
    t.boolean  "is_main"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "media_id"
  end

  create_table "sku_productships", :force => true do |t|
    t.integer  "sku_id"
    t.integer  "product_id"
    t.string   "package_name"
    t.integer  "package_num"
    t.decimal  "sales_bef_tax", :precision => 10, :scale => 0
    t.decimal  "sales_aft_tax", :precision => 10, :scale => 0
    t.boolean  "is_main"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "media_id"
    t.string   "Material_id"
  end

  create_table "skus", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.integer  "brand_id"
    t.integer  "sku_category_id"
    t.string   "unit"
    t.string   "specification"
    t.string   "delivery_day"
    t.integer  "sku_type"
    t.string   "model"
    t.string   "size"
    t.text     "delivery_description"
    t.boolean  "can_return"
    t.text     "description"
    t.string   "color"
    t.boolean  "can_on_be_half"
    t.integer  "classifcation"
    t.boolean  "is_integral"
    t.integer  "integral"
    t.text     "introduction"
    t.text     "advertisement"
    t.integer  "status",                                                  :default => 2
    t.integer  "sales_status",                                            :default => 0
    t.decimal  "cost_bef_tax",              :precision => 8, :scale => 2
    t.decimal  "cost_aft_tax",              :precision => 8, :scale => 2
    t.decimal  "market_price",              :precision => 8, :scale => 2
    t.decimal  "assembling_fee_bef_tax",    :precision => 8, :scale => 2
    t.decimal  "assembling_fee_aft_tax",    :precision => 8, :scale => 2
    t.decimal  "installation_cost_bef_tax", :precision => 8, :scale => 2
    t.decimal  "installation_cost_aft_tax", :precision => 8, :scale => 2
    t.string   "create_by"
    t.string   "update_by"
    t.integer  "total_sale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slider_bars", :force => true do |t|
    t.string   "name"
    t.string   "href"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "station_procedureships", :force => true do |t|
    t.integer  "procedure_id"
    t.integer  "station_id"
    t.integer  "condition_id"
    t.integer  "next_station_id"
    t.integer  "business_function_id"
    t.string   "operate_url"
    t.string   "target"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "active"
    t.integer  "sequence"
    t.integer  "sub_sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "condition_function"
    t.string   "business_function"
    t.integer  "station_type"
    t.integer  "sequence"
    t.integer  "safe_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "store_entries", :force => true do |t|
    t.string   "number"
    t.integer  "purchase_id"
    t.integer  "ordering_company_id"
    t.integer  "supplier_id"
    t.integer  "store_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "store_entry_product_carts", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity",                                         :default => 0
    t.date     "delivery_date"
    t.decimal  "unit_price_aft_tax", :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "total_amount",       :precision => 8, :scale => 2, :default => 0.0
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_type"
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "input_person"
    t.string   "contact_name"
    t.string   "contact_way"
    t.string   "terms_of_exchange"
    t.string   "delivery"
    t.string   "level"
    t.integer  "active"
    t.string   "create_by"
    t.string   "update_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "tracks", :force => true do |t|
    t.integer  "instance_id"
    t.integer  "station_id"
    t.integer  "condition_id"
    t.integer  "next_station_id"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "district_no"
    t.string   "name"
    t.string   "address"
    t.string   "zip"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_numbers", :force => true do |t|
    t.integer  "person_no"
    t.integer  "company_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login_no"
    t.integer  "role_id"
    t.integer  "status"
    t.integer  "user_type"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "store_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
