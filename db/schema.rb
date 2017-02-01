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

ActiveRecord::Schema.define(version: 20170131024604) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "emailable_id"
    t.string   "emailable_type"
  end

  add_index "emails", ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id"

  create_table "jobs", force: :cascade do |t|
    t.date     "job_date"
    t.boolean  "job_status", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.string   "type"
    t.integer  "company_id"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "line_items", force: :cascade do |t|
    t.integer  "fee"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "type"
    t.integer  "quantity"
    t.integer  "itemizable_id"
    t.string   "itemizable_type"
    t.integer  "job_id"
  end

  add_index "line_items", ["itemizable_type", "itemizable_id"], name: "index_line_items_on_itemizable_type_and_itemizable_id"
  add_index "line_items", ["job_id"], name: "index_line_items_on_job_id"

  create_table "locations", force: :cascade do |t|
    t.text     "address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "locatable_id"
    t.string   "locatable_type"
  end

  add_index "locations", ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "personable_id"
    t.string   "personable_type"
  end

  add_index "people", ["personable_type", "personable_id"], name: "index_people_on_personable_type_and_personable_id"

  create_table "phones", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "phone_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
  end

  add_index "phones", ["phoneable_type", "phoneable_id"], name: "index_phones_on_phoneable_type_and_phoneable_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "role"
    t.integer  "commission_number"
    t.date     "commission_expiration"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
