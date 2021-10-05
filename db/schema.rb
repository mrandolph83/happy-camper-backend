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

ActiveRecord::Schema.define(version: 2021_10_05_145429) do

  create_table "rec_areas", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "images"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city_state"
    t.string "latitude"
    t.string "longitude"
    t.string "url"
    t.string "activities"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rec_area_id"
    t.string "description"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.integer "nature_review"
    t.integer "amenities_review"
    t.integer "activities_review"
    t.integer "family_review"
  end

  create_table "user_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rec_area_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.integer "user_favorites_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
