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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140801000256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "username",         null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["username"], name: "index_admins_on_username", unique: true, using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "background_img"
    t.string   "email"
    t.integer  "phone"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "eventbrite_page"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "avatar"
    t.string   "type_of_user"
    t.string   "twitter"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

end
