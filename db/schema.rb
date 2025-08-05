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

ActiveRecord::Schema.define(version: 2025_08_04_183513) do

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer "milestone_id"
    t.text "note"
    t.date "date"
    t.integer "age_months"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["milestone_id"], name: "index_entries_on_milestone_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.integer "child_id"
    t.string "title"
    t.string "milestone_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_id"], name: "index_milestones_on_child_id"
  end

  add_foreign_key "entries", "milestones"
  add_foreign_key "milestones", "children"
end
