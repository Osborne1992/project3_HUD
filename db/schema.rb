# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160121145640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "group_id"
    t.integer  "review_id"
    t.integer  "tournament_id"
    t.integer  "user_id"
    t.text     "body"
    t.integer  "plus_one"
    t.integer  "minus_one"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "creator_id"
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["group_id"], name: "index_comments_on_group_id", using: :btree
  add_index "comments", ["review_id"], name: "index_comments_on_review_id", using: :btree
  add_index "comments", ["tournament_id"], name: "index_comments_on_tournament_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "event_tournaments", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "event_tournaments", ["event_id"], name: "index_event_tournaments_on_event_id", using: :btree
  add_index "event_tournaments", ["tournament_id"], name: "index_event_tournaments_on_tournament_id", using: :btree

  create_table "event_users", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_users", ["event_id"], name: "index_event_users_on_event_id", using: :btree
  add_index "event_users", ["user_id"], name: "index_event_users_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "host"
    t.integer  "creator_id"
    t.datetime "start_date"
    t.datetime "start_time"
    t.datetime "end_date"
    t.datetime "end_time"
    t.text     "description"
    t.boolean  "private"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id", using: :btree

  create_table "game_platforms", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "platform_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "game_platforms", ["game_id"], name: "index_game_platforms_on_game_id", using: :btree
  add_index "game_platforms", ["platform_id"], name: "index_game_platforms_on_platform_id", using: :btree

  create_table "game_users", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_users", ["game_id"], name: "index_game_users_on_game_id", using: :btree
  add_index "game_users", ["user_id"], name: "index_game_users_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "genre"
    t.integer  "rating"
    t.string   "publisher"
    t.string   "developer"
    t.datetime "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
  end

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id", using: :btree
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.boolean  "private"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "platform_users", force: :cascade do |t|
    t.integer  "platform_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "platform_users", ["platform_id"], name: "index_platform_users_on_platform_id", using: :btree
  add_index "platform_users", ["user_id"], name: "index_platform_users_on_user_id", using: :btree

  create_table "platforms", force: :cascade do |t|
    t.string   "name"
    t.string   "owner"
    t.integer  "released"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.text     "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.integer  "rate_average"
    t.integer  "rate_story"
    t.integer  "rate_difficulty"
    t.integer  "rate_length"
    t.integer  "rate_mechanics"
    t.integer  "rate_audio"
    t.integer  "rate_performance"
    t.integer  "rate_art_style"
    t.integer  "rate_immersion"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "platform_id"
  end

  add_index "reviews", ["game_id"], name: "index_reviews_on_game_id", using: :btree
  add_index "reviews", ["platform_id"], name: "index_reviews_on_platform_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournament_users", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tournament_users", ["tournament_id"], name: "index_tournament_users_on_tournament_id", using: :btree
  add_index "tournament_users", ["user_id"], name: "index_tournament_users_on_user_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.string   "host"
    t.integer  "creator_id"
    t.datetime "start_date"
    t.datetime "start_time"
    t.datetime "end_date"
    t.datetime "end_time"
    t.text     "description"
    t.boolean  "private"
    t.string   "location"
    t.integer  "game_id"
    t.integer  "platform_id"
    t.string   "first_prize"
    t.string   "second_prize"
    t.string   "third_prize"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tournaments", ["game_id"], name: "index_tournaments_on_game_id", using: :btree
  add_index "tournaments", ["platform_id"], name: "index_tournaments_on_platform_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username",               default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "steam_id"
    t.string   "origin_id"
    t.string   "uplay_id"
    t.string   "xbox_user"
    t.string   "psn"
    t.string   "nnid"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "groups"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "tournaments"
  add_foreign_key "comments", "users"
  add_foreign_key "event_tournaments", "events"
  add_foreign_key "event_tournaments", "tournaments"
  add_foreign_key "event_users", "events"
  add_foreign_key "event_users", "users"
  add_foreign_key "friendships", "users"
  add_foreign_key "game_platforms", "games"
  add_foreign_key "game_platforms", "platforms"
  add_foreign_key "game_users", "games"
  add_foreign_key "game_users", "users"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "platform_users", "platforms"
  add_foreign_key "platform_users", "users"
  add_foreign_key "reviews", "games"
  add_foreign_key "reviews", "platforms"
  add_foreign_key "reviews", "users"
  add_foreign_key "tournament_users", "tournaments"
  add_foreign_key "tournament_users", "users"
  add_foreign_key "tournaments", "games"
  add_foreign_key "tournaments", "platforms"
end
