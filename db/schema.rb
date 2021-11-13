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

ActiveRecord::Schema.define(version: 2021_11_13_172322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_valid_to_reservations", force: :cascade do |t|
    t.boolean "valid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parking_spots", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "user_name"
    t.date "time_booked"
    t.bigint "parking_spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "reserved"
    t.index ["parking_spot_id"], name: "index_reservations_on_parking_spot_id"
  end

  add_foreign_key "reservations", "parking_spots"
end