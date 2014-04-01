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

ActiveRecord::Schema.define(version: 20140401074621) do

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.integer  "point"
    t.string   "status"
    t.text     "memo"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "week_id"
    t.integer  "user_id"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "uid",        null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

  create_table "weeks", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
