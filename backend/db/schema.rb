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

ActiveRecord::Schema.define(version: 2024_07_31_130225) do

  create_table "runners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "runs", force: :cascade do |t|
    t.integer "runner_id"
    t.integer "shoe_id"
    t.integer "distance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cadence"
    t.integer "average_heart_rate"
    t.decimal "average_pace"
    t.integer "calories_burned"
    t.integer "total_time_minutes"
    t.index ["runner_id"], name: "index_runs_on_runner_id"
    t.index ["shoe_id"], name: "index_runs_on_shoe_id"
  end

  create_table "shoes", force: :cascade do |t|
    t.integer "runner_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["runner_id"], name: "index_shoes_on_runner_id"
  end

  add_foreign_key "runs", "runners"
  add_foreign_key "runs", "shoes"
  add_foreign_key "shoes", "runners"
end
