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

ActiveRecord::Schema.define(version: 2018_10_18_194129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "first_name", limit: 45, default: "", null: false
    t.string "last_name", limit: 45, default: "", null: false
    t.integer "admin_role", limit: 2, default: 3, null: false
    t.text "description", default: ""
    t.string "status", default: "A", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

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

  create_table "courses", force: :cascade do |t|
    t.string "name", limit: 100, default: "", null: false
    t.bigint "code", null: false
    t.boolean "has_laboratory", default: false, null: false
    t.string "status", default: "A", null: false
    t.text "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollment_details", force: :cascade do |t|
    t.text "description", default: ""
    t.string "status", default: "A", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollment_headers", force: :cascade do |t|
    t.integer "laboratory_counter", limit: 2, default: 0, null: false
    t.text "description", default: ""
    t.string "status", default: "A", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "semester_id"
    t.bigint "student_id"
    t.index ["semester_id"], name: "index_enrollment_headers_on_semester_id"
    t.index ["student_id"], name: "index_enrollment_headers_on_student_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", limit: 1, default: "", null: false
    t.string "status", default: "A", null: false
    t.text "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratories", id: false, force: :cascade do |t|
    t.integer "quota", limit: 2, default: 25, null: false
    t.text "description", default: ""
    t.string "status", default: "A", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.bigint "group_id"
    t.bigint "teacher_id"
    t.index ["course_id"], name: "index_laboratories_on_course_id"
    t.index ["group_id"], name: "index_laboratories_on_group_id"
    t.index ["teacher_id"], name: "index_laboratories_on_teacher_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.boolean "is_even", null: false
    t.date "start_date", null: false
    t.date "finish_date"
    t.string "status", limit: 1, null: false
    t.text "backup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", limit: 45, default: "", null: false
    t.string "last_name", limit: 45, default: "", null: false
    t.integer "cui", null: false
    t.boolean "authorized", default: true, null: false
    t.boolean "certificate_uploaded", default: false, null: false
    t.boolean "enrolled", default: false, null: false
    t.integer "course_codes", default: [], null: false, array: true
    t.text "description", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "clasification_id"
    t.index ["clasification_id"], name: "index_students_on_clasification_id"
    t.index ["cui"], name: "index_students_on_cui", unique: true
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", limit: 45, default: "", null: false
    t.string "last_name", limit: 45, default: "", null: false
    t.text "description", default: ""
    t.string "status", default: "A", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  add_foreign_key "enrollment_headers", "semesters"
  add_foreign_key "enrollment_headers", "students"
  add_foreign_key "laboratories", "courses"
  add_foreign_key "laboratories", "groups"
  add_foreign_key "laboratories", "teachers"
  add_foreign_key "students", "clasifications"
end
