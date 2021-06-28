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

ActiveRecord::Schema.define(version: 2021_06_13_124617) do

  create_table "acorns", charset: "utf8mb4", force: :cascade do |t|
    t.integer "number", default: 1, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_acorns_on_user_id", unique: true
  end

  create_table "activities", charset: "utf8mb4", force: :cascade do |t|
    t.integer "video_views", default: 0, null: false
    t.integer "video_viewing_time", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_activities_on_user_id", unique: true
  end

  create_table "settings", charset: "utf8mb4", force: :cascade do |t|
    t.integer "notification", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_settings_on_user_id", unique: true
  end

  create_table "squirrels", charset: "utf8mb4", force: :cascade do |t|
    t.integer "number", default: 6, null: false
    t.integer "total_number", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_squirrels_on_user_id", unique: true
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "line_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["line_user_id"], name: "index_users_on_line_user_id", unique: true
  end

  create_table "videos", charset: "utf8mb4", force: :cascade do |t|
    t.string "youtube_id", null: false
    t.integer "category", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["youtube_id"], name: "index_videos_on_youtube_id", unique: true
  end

  add_foreign_key "acorns", "users"
  add_foreign_key "activities", "users"
  add_foreign_key "settings", "users"
  add_foreign_key "squirrels", "users"
end
