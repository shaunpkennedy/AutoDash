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

ActiveRecord::Schema.define(version: 20170207030150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "autos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "make"
    t.string   "model"
    t.integer  "auto_year"
    t.integer  "current_odometer"
    t.integer  "oil_change_frequence"
    t.integer  "tire_rotation_frequency"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_autos_on_user_id", using: :btree
  end

  create_table "fuel_logs", force: :cascade do |t|
    t.integer  "auto_id"
    t.datetime "log_date"
    t.integer  "odometer"
    t.decimal  "ppg"
    t.decimal  "gallons"
    t.decimal  "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auto_id"], name: "index_fuel_logs_on_auto_id", using: :btree
  end

  create_table "service_logs", force: :cascade do |t|
    t.integer  "auto_id"
    t.datetime "log_date"
    t.integer  "service_type_id"
    t.integer  "odometer"
    t.decimal  "total_cost"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["auto_id"], name: "index_service_logs_on_auto_id", using: :btree
    t.index ["service_type_id"], name: "index_service_logs_on_service_type_id", using: :btree
  end

  create_table "service_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "autos", "users"
  add_foreign_key "fuel_logs", "autos"
  add_foreign_key "service_logs", "autos"
  add_foreign_key "service_logs", "service_types"
end
