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

ActiveRecord::Schema.define(version: 2021_01_26_072358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "follower_followee_mappings", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "followee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followee_id"], name: "index_follower_followee_mappings_on_followee_id"
    t.index ["follower_id", "followee_id"], name: "index_follower_followee_mappings_on_follower_id_and_followee_id", unique: true
    t.index ["follower_id"], name: "index_follower_followee_mappings_on_follower_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_api_keys", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "user_access_token", null: false
    t.boolean "is_active", default: false, null: false
    t.datetime "expiry", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_access_token"], name: "index_user_api_keys_on_user_access_token"
    t.index ["user_id"], name: "index_user_api_keys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password"
    t.string "name", null: false
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "follower_followee_mappings", "users", column: "followee_id"
  add_foreign_key "follower_followee_mappings", "users", column: "follower_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "user_api_keys", "users"
end
