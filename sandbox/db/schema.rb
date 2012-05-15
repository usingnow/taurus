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

ActiveRecord::Schema.define(:version => 20120515035156) do

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taurus_administrators", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "status"
    t.string   "name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "zip_code"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taurus_administrators", ["email"], :name => "index_taurus_administrators_on_email", :unique => true
  add_index "taurus_administrators", ["reset_password_token"], :name => "index_taurus_administrators_on_reset_password_token", :unique => true

  create_table "taurus_announcements", :force => true do |t|
    t.string   "title"
    t.string   "internal_title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_brands", :force => true do |t|
    t.string   "chinese_name"
    t.string   "english_name"
    t.string   "pinyin"
    t.string   "web_address"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "company_name"
    t.text     "company_description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_cities", :force => true do |t|
    t.integer  "province_id"
    t.string   "name"
    t.string   "number"
    t.decimal  "free_shipping_limit", :precision => 8, :scale => 2
    t.decimal  "shipping_fee",        :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taurus_cities", ["province_id"], :name => "index_taurus_cities_on_province_id"

  create_table "taurus_company_extends", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "web_address"
    t.integer  "industry_id"
    t.integer  "company_type_id"
    t.integer  "company_scale_id"
    t.integer  "district_id"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "zip_code"
    t.string   "contact_name"
    t.string   "contact_dept"
    t.string   "contact_post"
    t.string   "contact_mobile"
    t.integer  "contact_sex"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taurus_company_extends", ["company_scale_id"], :name => "index_taurus_company_extends_on_company_scale_id"
  add_index "taurus_company_extends", ["company_type_id"], :name => "index_taurus_company_extends_on_company_type_id"
  add_index "taurus_company_extends", ["created_by"], :name => "index_taurus_company_extends_on_created_by"
  add_index "taurus_company_extends", ["district_id"], :name => "index_taurus_company_extends_on_district_id"
  add_index "taurus_company_extends", ["industry_id"], :name => "index_taurus_company_extends_on_industry_id"
  add_index "taurus_company_extends", ["updated_by"], :name => "index_taurus_company_extends_on_updated_by"

  create_table "taurus_company_scales", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_company_types", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_components", :force => true do |t|
    t.integer  "system_id"
    t.string   "name"
    t.string   "description"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "taurus_districts", :force => true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.string   "number"
    t.decimal  "free_shipping_limit", :precision => 8, :scale => 2
    t.decimal  "shipping_fee",        :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taurus_districts", ["city_id"], :name => "index_taurus_districts_on_city_id"

  create_table "taurus_groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_images", :force => true do |t|
    t.integer  "page"
    t.integer  "location"
    t.text     "description"
    t.integer  "line_type",          :default => 0
    t.string   "href"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taurus_images", ["location"], :name => "index_taurus_images_on_location"
  add_index "taurus_images", ["page"], :name => "index_taurus_images_on_page"

  create_table "taurus_industries", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_person_extends", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.integer  "sex"
    t.date     "birth"
    t.integer  "district_id"
    t.string   "phone"
    t.string   "address"
    t.string   "zip_code"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taurus_person_extends", ["created_by"], :name => "index_taurus_person_extends_on_created_by"
  add_index "taurus_person_extends", ["district_id"], :name => "index_taurus_person_extends_on_district_id"
  add_index "taurus_person_extends", ["updated_by"], :name => "index_taurus_person_extends_on_updated_by"

  create_table "taurus_product_categories", :force => true do |t|
    t.integer  "parent_id"
    t.string   "number"
    t.string   "name"
    t.text     "description"
    t.integer  "sequence",    :default => 0
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_provinces", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.decimal  "free_shipping_limit", :precision => 8, :scale => 2
    t.decimal  "shipping_fee",        :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_reserved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_sku_displays", :force => true do |t|
    t.integer  "sku_id"
    t.integer  "sequence"
    t.integer  "page"
    t.integer  "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taurus_sku_displays", ["location"], :name => "index_taurus_sku_displays_on_location"
  add_index "taurus_sku_displays", ["page"], :name => "index_taurus_sku_displays_on_page"
  add_index "taurus_sku_displays", ["sku_id"], :name => "index_taurus_sku_displays_on_sku_id"

  create_table "taurus_slider_bars", :force => true do |t|
    t.string   "name"
    t.string   "href"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_stores", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_suppliers", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "terms_of_exchange"
    t.string   "delivery"
    t.string   "level"
    t.boolean  "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taurus_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "taurus_userable_id"
    t.string   "taurus_userable_type"
    t.integer  "points"
    t.integer  "store_id"
    t.integer  "role_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taurus_users", ["email"], :name => "index_taurus_users_on_email", :unique => true
  add_index "taurus_users", ["reset_password_token"], :name => "index_taurus_users_on_reset_password_token", :unique => true
  add_index "taurus_users", ["role_id"], :name => "index_taurus_users_on_role_id"
  add_index "taurus_users", ["store_id"], :name => "index_taurus_users_on_store_id"

end
