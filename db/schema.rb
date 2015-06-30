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

ActiveRecord::Schema.define(version: 20150629095028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

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

  create_table "api_keys", force: :cascade do |t|
    t.string   "key"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

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
  add_index "contact_informations", ["info_type"], name: "index_contact_informations_on_info_type", using: :btree
  add_index "contact_informations", ["value"], name: "index_contact_informations_on_value", using: :btree

  create_table "contact_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "human_readable_name"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "fmid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_role_id"
    t.hstore   "additional_data"
  end

  add_index "contacts", ["additional_data"], name: "index_contacts_on_additional_data", using: :btree
  add_index "contacts", ["contact_role_id"], name: "index_contacts_on_contact_role_id", using: :btree

  create_table "defects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.integer  "line_item_id"
    t.string   "name"
    t.decimal  "discount"
    t.boolean  "enabled",      default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "discounts", ["enabled"], name: "index_discounts_on_enabled", using: :btree
  add_index "discounts", ["line_item_id"], name: "index_discounts_on_line_item_id", using: :btree

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
    t.decimal  "price",        precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fmid"
    t.datetime "completed_at"
  end

  add_index "line_items", ["completed_at"], name: "index_line_items_on_completed_at", using: :btree
  add_index "line_items", ["created_at"], name: "index_line_items_on_created_at", using: :btree
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
    t.integer  "contact_id"
  end

  add_index "materials", ["contact_id"], name: "index_materials_on_contact_id", using: :btree

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
    t.integer  "tax_id"
  end

  add_index "orders", ["billing_address_id"], name: "index_orders_on_billing_address_id", using: :btree
  add_index "orders", ["completed_at"], name: "index_orders_on_completed_at", using: :btree
  add_index "orders", ["contact_id"], name: "index_orders_on_contact_id", using: :btree
  add_index "orders", ["created_at"], name: "index_orders_on_created_at", using: :btree
  add_index "orders", ["delivery_address_id"], name: "index_orders_on_delivery_address_id", using: :btree
  add_index "orders", ["tax_id"], name: "index_orders_on_tax_id", using: :btree

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

  create_table "product_inventories", force: :cascade do |t|
    t.integer  "year"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_inventory_items", force: :cascade do |t|
    t.integer  "product_inventory_id"
    t.integer  "product_id"
    t.integer  "contact_id"
    t.date     "entered_on"
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
    t.decimal  "value"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "product_inventory_items", ["contact_id"], name: "index_product_inventory_items_on_contact_id", using: :btree
  add_index "product_inventory_items", ["entered_on"], name: "index_product_inventory_items_on_entered_on", using: :btree
  add_index "product_inventory_items", ["g1"], name: "index_product_inventory_items_on_g1", using: :btree
  add_index "product_inventory_items", ["g10"], name: "index_product_inventory_items_on_g10", using: :btree
  add_index "product_inventory_items", ["g10h"], name: "index_product_inventory_items_on_g10h", using: :btree
  add_index "product_inventory_items", ["g11"], name: "index_product_inventory_items_on_g11", using: :btree
  add_index "product_inventory_items", ["g11h"], name: "index_product_inventory_items_on_g11h", using: :btree
  add_index "product_inventory_items", ["g12"], name: "index_product_inventory_items_on_g12", using: :btree
  add_index "product_inventory_items", ["g12h"], name: "index_product_inventory_items_on_g12h", using: :btree
  add_index "product_inventory_items", ["g13"], name: "index_product_inventory_items_on_g13", using: :btree
  add_index "product_inventory_items", ["g13h"], name: "index_product_inventory_items_on_g13h", using: :btree
  add_index "product_inventory_items", ["g14"], name: "index_product_inventory_items_on_g14", using: :btree
  add_index "product_inventory_items", ["g14h"], name: "index_product_inventory_items_on_g14h", using: :btree
  add_index "product_inventory_items", ["g15"], name: "index_product_inventory_items_on_g15", using: :btree
  add_index "product_inventory_items", ["g16"], name: "index_product_inventory_items_on_g16", using: :btree
  add_index "product_inventory_items", ["g1h"], name: "index_product_inventory_items_on_g1h", using: :btree
  add_index "product_inventory_items", ["g2"], name: "index_product_inventory_items_on_g2", using: :btree
  add_index "product_inventory_items", ["g2h"], name: "index_product_inventory_items_on_g2h", using: :btree
  add_index "product_inventory_items", ["g3"], name: "index_product_inventory_items_on_g3", using: :btree
  add_index "product_inventory_items", ["g3h"], name: "index_product_inventory_items_on_g3h", using: :btree
  add_index "product_inventory_items", ["g4"], name: "index_product_inventory_items_on_g4", using: :btree
  add_index "product_inventory_items", ["g4h"], name: "index_product_inventory_items_on_g4h", using: :btree
  add_index "product_inventory_items", ["g5"], name: "index_product_inventory_items_on_g5", using: :btree
  add_index "product_inventory_items", ["g5h"], name: "index_product_inventory_items_on_g5h", using: :btree
  add_index "product_inventory_items", ["g6"], name: "index_product_inventory_items_on_g6", using: :btree
  add_index "product_inventory_items", ["g6h"], name: "index_product_inventory_items_on_g6h", using: :btree
  add_index "product_inventory_items", ["g7"], name: "index_product_inventory_items_on_g7", using: :btree
  add_index "product_inventory_items", ["g7h"], name: "index_product_inventory_items_on_g7h", using: :btree
  add_index "product_inventory_items", ["g8"], name: "index_product_inventory_items_on_g8", using: :btree
  add_index "product_inventory_items", ["g8h"], name: "index_product_inventory_items_on_g8h", using: :btree
  add_index "product_inventory_items", ["g9"], name: "index_product_inventory_items_on_g9", using: :btree
  add_index "product_inventory_items", ["g9h"], name: "index_product_inventory_items_on_g9h", using: :btree
  add_index "product_inventory_items", ["product_id"], name: "index_product_inventory_items_on_product_id", using: :btree
  add_index "product_inventory_items", ["product_inventory_id"], name: "index_product_inventory_items_on_product_inventory_id", using: :btree

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
    t.string   "product_family"
    t.decimal  "retail_price",                 precision: 8, scale: 2
  end

  add_index "products", ["size_set_id"], name: "index_products_on_size_set_id", using: :btree

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
    t.integer  "contact_id"
    t.boolean  "final_step",     default: false
  end

  add_index "series_step_entries", ["contact_id"], name: "index_series_step_entries_on_contact_id", using: :btree
  add_index "series_step_entries", ["date"], name: "index_series_step_entries_on_date", using: :btree
  add_index "series_step_entries", ["final_step"], name: "index_series_step_entries_on_final_step", using: :btree
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

  create_table "taxes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
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
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "final_step", default: false
  end

  add_foreign_key "comments", "users"
  add_foreign_key "discounts", "line_items"
  add_foreign_key "material_consumptions", "materials"
  add_foreign_key "material_consumptions", "products"
  add_foreign_key "material_properties", "materials"
  add_foreign_key "materials", "contacts"
  add_foreign_key "orders", "taxes"
  add_foreign_key "product_inventory_items", "contacts"
  add_foreign_key "product_inventory_items", "product_inventories"
  add_foreign_key "product_inventory_items", "products"
  add_foreign_key "return_line_items", "products"
  add_foreign_key "return_line_items", "returns"
  add_foreign_key "returns", "addresses", column: "billing_address_id"
  add_foreign_key "returns", "contacts"
  add_foreign_key "series", "products"
  add_foreign_key "series_step_entries", "contacts"
  add_foreign_key "series_step_entries", "series_steps"
  add_foreign_key "series_steps", "series"
  add_foreign_key "series_steps", "work_steps"
end
