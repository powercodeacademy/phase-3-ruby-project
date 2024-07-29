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

ActiveRecord::Schema.define(version: 2024_07_29_165943) do

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "phone_number"
    t.string "email_address"
    t.decimal "current_amount_owed", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "tool_id"
    t.date "date_out"
    t.date "date_in"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_rentals_on_customer_id"
    t.index ["tool_id"], name: "index_rentals_on_tool_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price_per_day", precision: 8, scale: 2
    t.string "phone_number"
    t.boolean "availability", default: true
    t.string "category"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "rentals", "customers"
  add_foreign_key "rentals", "tools"
end
