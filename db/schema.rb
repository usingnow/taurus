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

ActiveRecord::Schema.define(:version => 20111212104206) do

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
    t.time     "create_time"
    t.string   "created_by"
    t.time     "update_time"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
