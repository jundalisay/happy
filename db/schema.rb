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

ActiveRecord::Schema.define(version: 20171216041649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listenings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "song_id"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_listenings_on_song_id"
    t.index ["user_id"], name: "index_listenings_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "artist_id"
    t.integer "song_id"
    t.string "title"
    t.string "album"
    t.string "link"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["genre_id"], name: "index_songs_on_genre_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.string "remember_digest"
    t.string "access_token"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "gender"
    t.string "genre1"
    t.string "genre2"
    t.string "genre3"
    t.string "artist1"
    t.string "artist2"
    t.string "artist3"
    t.string "status"
    t.text "about"
    t.string "photo"
    t.integer "viewcount", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_users_on_access_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "listenings", "songs"
  add_foreign_key "listenings", "users"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "genres"
end
