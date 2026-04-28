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

ActiveRecord::Schema[8.1].define(version: 2026_04_28_180156) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "asset_type"
    t.datetime "created_at", null: false
    t.bigint "location_id", null: false
    t.string "name"
    t.string "serial_number"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_assets_on_location_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "location_id", null: false
    t.string "name"
    t.integer "quantity"
    t.integer "reorder_amount"
    t.datetime "updated_at", null: false
    t.string "vendor"
    t.index ["location_id"], name: "index_inventory_items_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "region"
    t.datetime "updated_at", null: false
    t.index ["name", "region"], name: "index_locations_on_name_and_region", unique: true
  end

  create_table "maintenance_records", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.text "notes"
    t.datetime "performed_at"
    t.datetime "updated_at", null: false
    t.string "vendor"
    t.index ["asset_id"], name: "index_maintenance_records_on_asset_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "inventory_item_id", null: false
    t.bigint "location_id", null: false
    t.integer "quantity"
    t.string "status"
    t.datetime "updated_at", null: false
    t.string "vendor"
    t.index ["inventory_item_id"], name: "index_purchase_orders_on_inventory_item_id"
    t.index ["location_id"], name: "index_purchase_orders_on_location_id"
  end

  add_foreign_key "assets", "locations"
  add_foreign_key "inventory_items", "locations"
  add_foreign_key "maintenance_records", "assets"
  add_foreign_key "purchase_orders", "inventory_items"
  add_foreign_key "purchase_orders", "locations"
end
