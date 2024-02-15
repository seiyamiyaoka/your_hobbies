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

ActiveRecord::Schema[7.0].define(version: 2024_02_14_060854) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circles", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "owner_id", null: false
    t.bigint "hobby_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hobby_id"], name: "index_circles_on_hobby_id"
    t.index ["owner_id"], name: "index_circles_on_owner_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.text "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "hobbies", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_hobbies_on_name", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "circle_id", null: false
    t.text "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_posts_on_circle_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_circles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "circle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_user_circles_on_circle_id"
    t.index ["user_id"], name: "index_user_circles_on_user_id"
  end

  create_table "user_hobbies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "hobby_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hobby_id"], name: "index_user_hobbies_on_hobby_id"
    t.index ["user_id", "hobby_id"], name: "index_user_hobbies_on_user_id_and_hobby_id", unique: true
    t.index ["user_id"], name: "index_user_hobbies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "circles", "hobbies"
  add_foreign_key "circles", "users", column: "owner_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "circles"
  add_foreign_key "posts", "users"
  add_foreign_key "user_circles", "circles"
  add_foreign_key "user_circles", "users"
  add_foreign_key "user_hobbies", "hobbies"
  add_foreign_key "user_hobbies", "users"
end
