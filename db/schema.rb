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

ActiveRecord::Schema.define(version: 2021_05_02_104751) do

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.integer "createdByUserId"
    t.integer "toUserId"
    t.integer "rootCommentId"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_statuses", charset: "utf8mb4", force: :cascade do |t|
    t.string "projectStatus"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "project_status_id"
    t.datetime "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id", null: false
    t.bigint "status_id", null: false
    t.index ["status_id"], name: "index_projects_on_status_id"
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "skills", charset: "utf8mb4", force: :cascade do |t|
    t.string "skillName"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_member_relations", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "team_role_id"
    t.index ["team_id"], name: "index_team_member_relations_on_team_id"
    t.index ["team_role_id"], name: "index_team_member_relations_on_team_role_id"
    t.index ["user_id"], name: "index_team_member_relations_on_user_id"
  end

  create_table "team_roles", charset: "utf8mb4", force: :cascade do |t|
    t.string "roleTitle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "salt"
  end

  add_foreign_key "projects", "teams"
  add_foreign_key "team_member_relations", "teams"
  add_foreign_key "team_member_relations", "users"
end
