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

ActiveRecord::Schema.define(version: 20140812183804) do

  create_table "duties", force: true do |t|
    t.integer  "obliged_id"
    t.integer  "turn_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "appointed_at"
  end

  add_index "duties", ["obliged_id"], name: "index_duties_on_obliged_id"
  add_index "duties", ["turn_id"], name: "index_duties_on_turn_id"

  create_table "turn_memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "turn_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "turn_memberships", ["turn_id"], name: "index_turn_memberships_on_turn_id"
  add_index "turn_memberships", ["user_id"], name: "index_turn_memberships_on_user_id"

  create_table "turns", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "members_changed_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
