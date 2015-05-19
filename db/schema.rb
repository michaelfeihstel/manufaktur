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

ActiveRecord::Schema.define(version: 20150416073957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string  "description",  limit: 255
    t.integer "contact_id"
    t.string  "name",         limit: 255
    t.string  "street",       limit: 255
    t.string  "house_number", limit: 255
    t.string  "zip",          limit: 255
    t.string  "city",         limit: 255
    t.string  "country",      limit: 255
    t.integer "fmid"
  end

  add_index "addresses", ["contact_id"], name: "index_addresses_on_contact_id", using: :btree

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

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.integer  "commentable_id",                   null: false
    t.string   "commentable_type",                 null: false
    t.boolean  "important",        default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contact_informations", force: :cascade do |t|
    t.integer  "contact_id"
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.string   "info_type",  limit: 255
    t.boolean  "default",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_informations", ["contact_id"], name: "index_contact_informations_on_contact_id", using: :btree
  add_index "contact_informations", ["value"], name: "index_contact_informations_on_value", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "fmid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_role_id"
    t.string   "contact_role_type"
  end

  create_table "defects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true
  end

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

  create_table "material_consumptions", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "material_id"
    t.decimal  "yield_per_unit"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "material_consumptions", ["material_id"], name: "index_material_consumptions_on_material_id", using: :btree
  add_index "material_consumptions", ["product_id"], name: "index_material_consumptions_on_product_id", using: :btree

  create_table "material_properties", force: :cascade do |t|
    t.integer  "material_id"
    t.string   "name"
    t.string   "value"
    t.boolean  "use_in_name", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "material_properties", ["material_id"], name: "index_material_properties_on_material_id", using: :btree
  add_index "material_properties", ["use_in_name"], name: "index_material_properties_on_use_in_name", using: :btree

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
    t.integer  "contact_id"
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
  end

  add_index "orders", ["contact_id"], name: "index_orders_on_contact_id", using: :btree

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
    t.integer  "fmid"
    t.string   "primary_color",    limit: 255
    t.string   "secondary_color",  limit: 255
    t.string   "text_color",       limit: 255,                         default: "#fff"
    t.integer  "size_set_id"
  end

  create_table "retailers", force: :cascade do |t|
    t.integer  "contact_id"
    t.boolean  "allow_orders", default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "retailers", ["contact_id"], name: "index_retailers_on_contact_id", using: :btree

  create_table "return_line_items", force: :cascade do |t|
    t.integer  "return_id"
    t.integer  "product_id"
    t.integer  "g1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "return_line_items", ["product_id"], name: "index_return_line_items_on_product_id", using: :btree
  add_index "return_line_items", ["return_id"], name: "index_return_line_items_on_return_id", using: :btree

  create_table "returns", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "billing_address_id"
    t.text     "comment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "returns", ["billing_address_id"], name: "index_returns_on_billing_address_id", using: :btree
  add_index "returns", ["contact_id"], name: "index_returns_on_contact_id", using: :btree

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

  create_table "series_step_entries", force: :cascade do |t|
    t.integer  "series_step_id"
    t.integer  "employee_id"
    t.date     "date"
    t.boolean  "b_stock",        default: false
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
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "series_step_entries", ["date"], name: "index_series_step_entries_on_date", using: :btree
  add_index "series_step_entries", ["employee_id"], name: "index_series_step_entries_on_employee_id", using: :btree
  add_index "series_step_entries", ["series_step_id"], name: "index_series_step_entries_on_series_step_id", using: :btree

  create_table "series_steps", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "work_step_id"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "series_steps", ["series_id"], name: "index_series_steps_on_series_id", using: :btree
  add_index "series_steps", ["work_step_id"], name: "index_series_steps_on_work_step_id", using: :btree

  create_table "size_sets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "first_name"
    t.string   "last_name"
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

  add_foreign_key "comments", "users"
  add_foreign_key "material_consumptions", "materials"
  add_foreign_key "material_consumptions", "products"
  add_foreign_key "material_properties", "materials"
  add_foreign_key "retailers", "contacts"
  add_foreign_key "return_line_items", "products"
  add_foreign_key "return_line_items", "returns"
  add_foreign_key "returns", "addresses", column: "billing_address_id"
  add_foreign_key "returns", "contacts"
  add_foreign_key "series", "products"
  add_foreign_key "series_step_entries", "employees"
  add_foreign_key "series_step_entries", "series_steps"
  add_foreign_key "series_steps", "series"
  add_foreign_key "series_steps", "work_steps"
end
