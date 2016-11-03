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

ActiveRecord::Schema.define(version: 20161103003828) do

  create_table "alerts", force: :cascade do |t|
    t.string   "title"
    t.text     "context"
    t.datetime "when"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "doctor_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "speciality"
    t.string   "adress"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "openflag"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_favorites_on_doctor_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "note_date"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "flag"
  end

  create_table "pushes", force: :cascade do |t|
    t.string   "title"
    t.datetime "when"
    t.integer  "user_id"
    t.string   "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "question_date"
    t.text     "life"
    t.text     "past"
    t.text     "family"
    t.text     "alle"
    t.text     "pharm"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "adress"
    t.string   "emergence"
  end

end
