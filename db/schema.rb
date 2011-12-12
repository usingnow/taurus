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

end
