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

ActiveRecord::Schema.define(version: 20180128061810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string "list_name", null: false
    t.string "user_id", null: false
    t.text "description"
    t.datetime "end_date", null: false
    t.float "min_bid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "organization_name", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.string "private_wallet_key", null: false
    t.string "public_wallet_key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_name"], name: "index_users_on_organization_name", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "private_key", null: false
    t.integer "public_key", null: false
    t.float "balance", null: false
    t.float "escrow"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["public_key"], name: "index_wallets_on_public_key"
  end

end
