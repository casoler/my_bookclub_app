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

ActiveRecord::Schema.define(version: 20160913012540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_suggestions", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "isbn"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "author"
    t.string   "image_url"
    t.text     "description"
  end

  create_table "book_votes", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "google_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string   "genre"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "group_genres", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "about"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "group_id"
    t.datetime "meeting_date"
    t.string   "location"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.text     "notes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "selected_book_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "leader_flag"
  end

  create_table "selected_books", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "isbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "month"
    t.integer  "year"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "zip_code"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
