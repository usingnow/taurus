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

ActiveRecord::Schema.define(:version => 20111224050357) do

  create_table "admin_groups", :force => true do |t|
    t.string   "group_no"
    t.string   "group_name"
    t.string   "group_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "login_no"
    t.string   "password"
    t.integer  "status"
    t.string   "question"
    t.string   "answer"
    t.datetime "last_login_time"
    t.string   "email"
    t.integer  "sex"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "post"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins_admin_groups", :id => false, :force => true do |t|
    t.integer "admin_id"
    t.integer "admin_group_id"
  end

  add_index "admins_admin_groups", ["admin_group_id"], :name => "index_admins_admin_groups_on_admin_group_id"
  add_index "admins_admin_groups", ["admin_id", "admin_group_id"], :name => "index_admins_admin_groups_on_admin_id_and_admin_group_id", :unique => true

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
    t.integer  "quantity",   :default => 1
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
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
    t.string   "role_no"
    t.integer  "industry_type_id"
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

  create_table "conditions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instances", :force => true do |t|
    t.integer  "station_id"
    t.integer  "procedure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "sku_id"
    t.decimal  "unit_price",       :precision => 10, :scale => 0
    t.integer  "quantity"
    t.integer  "is_need_install"
    t.decimal  "install_cost",     :precision => 10, :scale => 0
    t.integer  "is_need_assemble"
    t.decimal  "assemble_cost",    :precision => 10, :scale => 0
    t.decimal  "other_cost",       :precision => 10, :scale => 0
    t.integer  "created_admin_id"
    t.integer  "updated_admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "reserve_reason"
    t.decimal  "other_cost",          :precision => 8, :scale => 2
    t.integer  "is_affect_details"
    t.string   "district_no"
    t.string   "name"
    t.string   "address"
    t.string   "zip"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.decimal  "carriage_cost",       :precision => 8, :scale => 2
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
  end

  create_table "person_extends", :force => true do |t|
    t.integer  "user_id"
    t.string   "person_no"
    t.string   "role_no"
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

  create_table "procedures", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.boolean  "active"
    t.integer  "sequence"
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
    t.integer  "type"
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
    t.integer  "status"
    t.integer  "sales_status"
    t.decimal  "cost_bef_tax",              :precision => 8, :scale => 2
    t.decimal  "cost_aft_tax",              :precision => 8, :scale => 2
    t.decimal  "market_price",              :precision => 8, :scale => 2
    t.decimal  "assembling_fee_bef_tax",    :precision => 8, :scale => 2
    t.decimal  "assembling_fee_aft_tax",    :precision => 8, :scale => 2
    t.decimal  "installation_cost_bef_tax", :precision => 8, :scale => 2
    t.decimal  "insatllation_cost_aft_tax", :precision => 8, :scale => 2
    t.string   "create_by"
    t.string   "update_by"
    t.integer  "total_sale"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "tracks", :force => true do |t|
    t.integer  "instance_id"
    t.integer  "station_id"
    t.integer  "condition_id"
    t.integer  "next_station_id"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login_no"
    t.string   "password"
    t.integer  "status"
    t.integer  "type"
    t.string   "question"
    t.string   "answer"
    t.datetime "last_login_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
