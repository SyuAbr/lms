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

ActiveRecord::Schema[7.1].define(version: 2024_05_21_153015) do
  create_table "permissions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.boolean "access_granted", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_permissions_on_task_id"
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.integer "grade", null: false
    t.datetime "date_complite", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_results_on_task_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "title", null: false
    t.text "descriptipn", null: false
    t.integer "grade", null: false
    t.integer "deadline", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "surname", null: false
    t.string "name", null: false
    t.string "middle_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
