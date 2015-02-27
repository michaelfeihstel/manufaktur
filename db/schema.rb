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

ActiveRecord::Schema.define(version: 20150227071212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string  "description",      limit: 255
    t.integer "addressable_id"
    t.string  "name",             limit: 255
    t.string  "street",           limit: 255
    t.string  "house_number",     limit: 255
    t.string  "zip",              limit: 255
    t.string  "city",             limit: 255
    t.string  "country",          limit: 255
    t.integer "fmid"
    t.string  "addressable_type"
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree

  create_table "admin_notes", force: :cascade do |t|
    t.string   "resource_id",     limit: 255, null: false
    t.string   "resource_type",   limit: 255, null: false
    t.integer  "admin_user_id"
    t.string   "admin_user_type", limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_notes", ["admin_user_type", "admin_user_id"], name: "index_admin_notes_on_admin_user_type_and_admin_user_id", using: :btree
  add_index "admin_notes", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree

  create_table "contact_informations", force: :cascade do |t|
    t.integer  "contactable_id"
    t.string   "name",             limit: 255
    t.string   "value",            limit: 255
    t.string   "info_type",        limit: 255
    t.boolean  "default",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contactable_type"
  end

  add_index "contact_informations", ["contactable_id"], name: "index_contact_informations_on_contactable_id", using: :btree
  add_index "contact_informations", ["contactable_type"], name: "index_contact_informations_on_contactable_type", using: :btree
  add_index "contact_informations", ["value"], name: "index_contact_informations_on_value", using: :btree

  create_table "letters", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "name",         limit: 255
    t.string   "street",       limit: 255
    t.string   "house_number", limit: 255
    t.string   "zip",          limit: 255
    t.string   "city",         limit: 255
    t.string   "country",      limit: 255
    t.string   "subject",      limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "letters", ["address_id"], name: "index_letters_on_address_id", using: :btree

  create_table "line_items", force: :cascade do |t|
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

  create_table "material_properties", force: :cascade do |t|
    t.integer  "material_id"
    t.string   "name"
    t.string   "value"
    t.boolean  "use_in_name", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "material_properties", ["material_id"], name: "index_material_properties_on_material_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.string   "supplier_sku"
    t.string   "unit"
    t.decimal  "price",        precision: 8, scale: 2
    t.text     "comment"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "delivered_on"
    t.datetime "invoiced_at"
    t.datetime "completed_at"
    t.integer  "customer_id"
    t.integer  "billing_address_id"
    t.integer  "delivery_address_id"
    t.string   "billing_name",          limit: 255
    t.string   "billing_street",        limit: 255
    t.string   "billing_house_number",  limit: 255
    t.string   "billing_zip",           limit: 255
    t.string   "billing_city",          limit: 255
    t.string   "billing_country",       limit: 255
    t.string   "delivery_name",         limit: 255
    t.string   "delivery_street",       limit: 255
    t.string   "delivery_house_number", limit: 255
    t.string   "delivery_city",         limit: 255
    t.string   "delivery_zip",          limit: 255
    t.string   "delivery_country",      limit: 255
    t.string   "delivery_iso",          limit: 255
    t.boolean  "is_webshop"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "marked",                                                    default: false, null: false
    t.integer  "fmid"
    t.text     "comment"
    t.boolean  "is_free",                                                   default: false
    t.boolean  "is_vat_exempt",                                             default: false
    t.date     "paid_on"
    t.decimal  "paid_amount",                       precision: 8, scale: 2
    t.boolean  "is_scheduled_delivery",                                     default: false
    t.date     "cashback_until"
    t.decimal  "cashback_percent",                  precision: 2, scale: 2, default: 0.03
    t.string   "customer_type"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["customer_type"], name: "index_orders_on_customer_type", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "sku",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                        precision: 8, scale: 2
    t.decimal  "vat"
    t.string   "color_text",       limit: 255
    t.integer  "variation_set_id"
    t.integer  "size_id"
    t.integer  "fmid"
    t.string   "primary_color",    limit: 255
    t.string   "secondary_color",  limit: 255
    t.string   "text_color",       limit: 255,                         default: "#fff"
  end

  create_table "retailers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "fmid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", force: :cascade do |t|
    t.integer  "product_id"
    t.date     "finished_on"
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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "name"
  end

  add_index "series", ["product_id"], name: "index_series_on_product_id", using: :btree

  create_table "sizes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "g1",         limit: 255
    t.string   "g1h",        limit: 255
    t.string   "g2",         limit: 255
    t.string   "g2h",        limit: 255
    t.string   "g3",         limit: 255
    t.string   "g3h",        limit: 255
    t.string   "g4",         limit: 255
    t.string   "g4h",        limit: 255
    t.string   "g5",         limit: 255
    t.string   "g5h",        limit: 255
    t.string   "g6",         limit: 255
    t.string   "g6h",        limit: 255
    t.string   "g7",         limit: 255
    t.string   "g7h",        limit: 255
    t.string   "g8",         limit: 255
    t.string   "g8h",        limit: 255
    t.string   "g9",         limit: 255
    t.string   "g9h",        limit: 255
    t.string   "g10",        limit: 255
    t.string   "g10h",       limit: 255
    t.string   "g11",        limit: 255
    t.string   "g11h",       limit: 255
    t.string   "g12",        limit: 255
    t.string   "g12h",       limit: 255
    t.string   "g13",        limit: 255
    t.string   "g13h",       limit: 255
    t.string   "g14",        limit: 255
    t.string   "g14h",       limit: 255
    t.string   "g15",        limit: 255
    t.string   "g16",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "variation_sets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variations", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "variation_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_steps", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "material_properties", "materials"
  add_foreign_key "series", "products"
end
