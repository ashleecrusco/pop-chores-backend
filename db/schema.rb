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

ActiveRecord::Schema.define(version: 20180103213848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chores", force: :cascade do |t|
    t.string "title"
    t.integer "point_value"
    t.string "description"
    t.integer "household_id"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.boolean "personal_chore", default: false
    t.integer "chore_owner"
    t.integer "complete_count", default: 0
    t.string "currently_assigned"
  end

  create_table "households", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_chores", force: :cascade do |t|
    t.integer "chore_id"
    t.integer "user_id"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "personal_chore"
    t.integer "points"
    t.string "title"
    t.string "image_url"
    t.string "date_completed"
    t.integer "likes", default: 0
    t.datetime "completed_at"
    t.datetime "claimed_at"
    t.integer "order_count"
  end

  create_table "user_households", force: :cascade do |t|
    t.integer "user_id"
    t.integer "household_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0
    t.string "profile_pic", default: "https://i.pinimg.com/736x/3d/d9/b8/3dd9b8d4404859689ec68bffc46f158d--facebook-profile-profile-pictures.jpg"
    t.string "status", default: "Ready to Clean!"
    t.integer "complete_count", default: 0
    t.string "currently_assigned"
  end

end
