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

ActiveRecord::Schema.define(version: 2021_01_21_210148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkout_sessions", force: :cascade do |t|
    t.bigint "price_id", null: false
    t.bigint "customer_id", null: false
    t.string "stripe_mode"
    t.string "success_url"
    t.string "cancel_url"
    t.string "payment_intent"
    t.string "payment_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stripe_id"
    t.index ["customer_id"], name: "index_checkout_sessions_on_customer_id"
    t.index ["price_id"], name: "index_checkout_sessions_on_price_id"
  end

  create_table "customer_yachts", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "yacht_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_yachts_on_customer_id"
    t.index ["yacht_id"], name: "index_customer_yachts_on_yacht_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stripe_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "marinas", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "unit_amount"
    t.string "stripe_type"
    t.string "recurring_interval"
    t.integer "recurring_count"
    t.string "stripe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_prices_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "marina_id", null: false
    t.string "stripe_product_id"
    t.boolean "active"
    t.string "stripe_attributes"
    t.text "description"
    t.string "images"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["marina_id"], name: "index_products_on_marina_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "yachts", force: :cascade do |t|
    t.string "name"
    t.integer "length"
    t.boolean "sail"
    t.string "registration_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "marina_id"
  end

  add_foreign_key "checkout_sessions", "customers"
  add_foreign_key "checkout_sessions", "prices"
  add_foreign_key "customer_yachts", "customers"
  add_foreign_key "customer_yachts", "yachts"
  add_foreign_key "prices", "products"
  add_foreign_key "products", "marinas"
  add_foreign_key "products", "users"
end
