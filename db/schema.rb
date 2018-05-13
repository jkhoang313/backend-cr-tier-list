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

ActiveRecord::Schema.define(version: 20180502004503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "card_type"
    t.integer  "rarity"
    t.integer  "elixir_cost"
    t.integer  "arena"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tier_list_selected_types", force: :cascade do |t|
    t.integer  "tier_list_id"
    t.integer  "tier_list_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["tier_list_id"], name: "index_tier_list_selected_types_on_tier_list_id", using: :btree
    t.index ["tier_list_type_id"], name: "index_tier_list_selected_types_on_tier_list_type_id", using: :btree
  end

  create_table "tier_list_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tier_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "upvotes",              default: 0
    t.jsonb    "tiers",                default: []
    t.integer  "primary_list_type_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["primary_list_type_id"], name: "index_tier_lists_on_primary_list_type_id", using: :btree
    t.index ["upvotes"], name: "index_tier_lists_on_upvotes", using: :btree
    t.index ["user_id"], name: "index_tier_lists_on_user_id", using: :btree
  end

  create_table "tiers", force: :cascade do |t|
    t.integer  "tier_list_id"
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.integer  "position"
    t.jsonb    "cards",        default: []
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["tier_list_id"], name: "index_tiers_on_tier_list_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "is_pro",          default: false
    t.string   "username"
    t.index ["email_address"], name: "index_users_on_email_address", using: :btree
  end

end
