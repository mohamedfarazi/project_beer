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

ActiveRecord::Schema.define(version: 20140311204358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: true do |t|
    t.date     "expected_date"
    t.boolean  "delivered"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "subscription_id"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.string   "freq"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount_in_cents"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "first_delivery_date"
    t.integer  "n_packs"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password",                            null: false
    t.string   "salt",                                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "address"
    t.string   "postal_code"
    t.string   "phone"
    t.string   "contact_name"
    t.string   "company_name"
    t.boolean  "area"
    t.boolean  "admin",                       default: false
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
