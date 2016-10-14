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

ActiveRecord::Schema.define(version: 20161013033156) do

  create_table "giving_games", force: :cascade do |t|
    t.string   "title",                                   default: "default title"
    t.text     "description",                             default: "default description"
    t.datetime "release_date"
    t.decimal  "total_money",     precision: 8, scale: 2, default: 10.0
    t.decimal  "per_transaction", precision: 8, scale: 2, default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "charityA_title",                          default: "Charity A"
    t.integer  "votesA",                                  default: 0
    t.string   "charityB_title",                          default: "Charity B"
    t.integer  "votesB",                                  default: 0
    t.boolean  "tutorial"
    t.string   "descriptionA"
    t.string   "descriptionB"
    t.boolean  "show_results"
    t.integer  "user_id"
    t.datetime "expiration_time"
    t.boolean  "expired",                                 default: false
    t.string   "charityA_image"
    t.string   "charityB_image"
    t.boolean  "is_private",                              default: false
    t.string   "private_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "username"
    t.text     "played_games"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
