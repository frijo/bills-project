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

ActiveRecord::Schema.define(version: 20160122035429) do

  create_table "food_categories", force: :cascade do |t|
    t.string   "category",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "food_categories", ["category"], name: "index_food_categories_on_category", unique: true

  create_table "foods", id: false, force: :cascade do |t|
    t.string   "code_food",          null: false
    t.string   "food_name",          null: false
    t.float    "cost_price",         null: false
    t.float    "sale_price",         null: false
    t.integer  "food_categories_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "foods", ["code_food"], name: "index_foods_on_code_food", unique: true
  add_index "foods", ["food_categories_id"], name: "index_foods_on_food_categories_id"
  add_index "foods", ["food_name"], name: "index_foods_on_food_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "nick_name",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",           null: false
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "profile_photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["nick_name"], name: "index_users_on_nick_name", unique: true

end
