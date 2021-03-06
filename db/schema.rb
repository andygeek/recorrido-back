# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_22_204823) do

  create_table "min_prices", force: :cascade do |t|
    t.integer "search_result_id"
    t.date "date_departure"
    t.time "hour"
    t.integer "class_id"
    t.string "class_name"
    t.decimal "min_price"
    t.string "buss_operator_name"
    t.integer "price_alert_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["price_alert_id"], name: "index_min_prices_on_price_alert_id"
  end

  create_table "price_alerts", force: :cascade do |t|
    t.string "name"
    t.integer "origin_id"
    t.string "origin_name"
    t.string "origin_url_name"
    t.integer "destiny_id"
    t.string "destiny_name"
    t.string "destiny_url_name"
    t.integer "class_id"
    t.string "class_name"
    t.decimal "price"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_price_alerts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "min_prices", "price_alerts"
  add_foreign_key "price_alerts", "users"
end
