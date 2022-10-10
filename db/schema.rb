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

ActiveRecord::Schema[7.0].define(version: 2022_10_08_125905) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "real_states", force: :cascade do |t|
    t.string "street_address"
    t.bigint "city_id"
    t.string "postcode"
    t.text "building_description"
    t.string "local_area_description"
    t.integer "center_status"
    t.string "product_name"
    t.string "source_identifier"
    t.float "total_building_size_sqm"
    t.integer "min_desks"
    t.integer "max_desks"
    t.integer "min_term"
    t.decimal "min_cost", precision: 10, scale: 2
    t.integer "area_size_unit", default: 1
    t.text "high_res_images"
    t.string "external_building_image"
    t.string "featured_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_real_states_on_city_id"
  end

  add_foreign_key "real_states", "cities"
end
