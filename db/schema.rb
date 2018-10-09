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

ActiveRecord::Schema.define(version: 2018_10_09_145534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clasifications", force: :cascade do |t|
    t.integer "value", limit: 2, null: false
    t.string "name", limit: 40, null: false
    t.date "start_date"
    t.date "finish_date"
    t.text "description"
    t.string "status", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "is_even", null: false
    t.date "start_date", null: false
    t.date "finish_date"
    t.integer "status", null: false
    t.string "description", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "firstname", limit: 45, null: false
    t.string "lastname", limit: 45, null: false
    t.string "email", limit: 40
    t.bigint "cui", null: false
    t.binary "has_certificate"
    t.binary "is_enrolled"
    t.integer "course_codes", default: [], array: true
    t.string "status", limit: 1, null: false
    t.text "description"
    t.bigint "clasification_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clasification_id_id"], name: "index_students_on_clasification_id_id"
  end

end
