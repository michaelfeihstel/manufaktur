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

ActiveRecord::Schema.define(version: 20140619124137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string  "description"
    t.integer "contact_id"
    t.string  "name"
    t.string  "street"
    t.string  "house_number"
    t.string  "zip"
    t.string  "city"
    t.string  "country"
    t.integer "fmid"
  end

  add_index "addresses", ["contact_id"], name: "index_addresses_on_contact_id", using: :btree

  create_table "admin_notes", force: true do |t|
    t.string   "resource_id",     null: false
    t.string   "resource_type",   null: false
    t.integer  "admin_user_id"
    t.string   "admin_user_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_notes", ["admin_user_type", "admin_user_id"], name: "index_admin_notes_on_admin_user_type_and_admin_user_id", using: :btree
  add_index "admin_notes", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_informations", force: true do |t|
    t.integer  "contact_id"
    t.string   "name"
    t.string   "value"
    t.string   "info_type"
    t.boolean  "default",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_informations", ["contact_id"], name: "index_contact_informations_on_contact_id", using: :btree
  add_index "contact_informations", ["value"], name: "index_contact_informations_on_value", using: :btree

  create_table "contacts", force: true do |t|
    t.string  "name"
    t.integer "fmid"
  end

  create_table "line_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.text     "comment"
    t.integer  "g1"
    t.integer  "g1h"
    t.integer  "g2"
    t.integer  "g2h"
    t.integer  "g3"
    t.integer  "g3h"
    t.integer  "g4"
    t.integer  "g4h"
    t.integer  "g5"
    t.integer  "g5h"
    t.integer  "g6"
    t.integer  "g6h"
    t.integer  "g7"
    t.integer  "g7h"
    t.integer  "g8"
    t.integer  "g8h"
    t.integer  "g9"
    t.integer  "g9h"
    t.integer  "g10"
    t.integer  "g10h"
    t.integer  "g11"
    t.integer  "g11h"
    t.integer  "g12"
    t.integer  "g12h"
    t.integer  "g13"
    t.integer  "g13h"
    t.integer  "g14"
    t.integer  "g14h"
    t.integer  "g15"
    t.integer  "g16"
    t.decimal  "vat"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fmid"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.date     "delivered_on"
    t.datetime "invoiced_at"
    t.datetime "completed_at"
    t.integer  "contact_id"
    t.integer  "billing_address_id"
    t.integer  "delivery_address_id"
    t.string   "billing_name"
    t.string   "billing_street"
    t.string   "billing_house_number"
    t.string   "billing_zip"
    t.string   "billing_city"
    t.string   "billing_country"
    t.string   "delivery_name"
    t.string   "delivery_street"
    t.string   "delivery_house_number"
    t.string   "delivery_city"
    t.string   "delivery_zip"
    t.string   "delivery_country"
    t.string   "delivery_iso"
    t.boolean  "is_webshop"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "marked",                default: false, null: false
    t.integer  "fmid"
    t.text     "comment"
    t.boolean  "is_free",               default: false
    t.boolean  "is_vat_exempt",         default: false
    t.date     "paid_on"
  end

  add_index "orders", ["contact_id"], name: "index_orders_on_contact_id", using: :btree

  create_table "product_images", force: true do |t|
    t.string   "url_old"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "sku"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",            precision: 8, scale: 2
    t.decimal  "vat"
    t.string   "color_text"
    t.integer  "variation_set_id"
    t.integer  "size_id"
    t.integer  "fmid"
    t.string   "primary_color"
    t.string   "secondary_color"
  end

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.string   "g1"
    t.string   "g1h"
    t.string   "g2"
    t.string   "g2h"
    t.string   "g3"
    t.string   "g3h"
    t.string   "g4"
    t.string   "g4h"
    t.string   "g5"
    t.string   "g5h"
    t.string   "g6"
    t.string   "g6h"
    t.string   "g7"
    t.string   "g7h"
    t.string   "g8"
    t.string   "g8h"
    t.string   "g9"
    t.string   "g9h"
    t.string   "g10"
    t.string   "g10h"
    t.string   "g11"
    t.string   "g11h"
    t.string   "g12"
    t.string   "g12h"
    t.string   "g13"
    t.string   "g13h"
    t.string   "g14"
    t.string   "g14h"
    t.string   "g15"
    t.string   "g16"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variation_sets", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variations", force: true do |t|
    t.string   "name"
    t.integer  "variation_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
