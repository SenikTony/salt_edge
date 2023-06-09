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

ActiveRecord::Schema[7.0].define(version: 2023_06_16_182223) do
  create_table "accounts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "connection_id"
    t.string "account_id"
    t.string "name"
    t.string "nature"
    t.decimal "balance", precision: 12, scale: 2
    t.string "currency_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transactions_count"
    t.index ["connection_id"], name: "index_accounts_on_connection_id"
  end

  create_table "connections", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.string "connection_id"
    t.string "provider_name"
    t.decimal "status", precision: 10, default: "0", null: false
    t.datetime "balance_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_consent_id"
    t.integer "accounts_count"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "transactions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "account_id"
    t.string "transaction_id"
    t.string "made_on"
    t.string "category"
    t.string "description"
    t.string "currency_code"
    t.decimal "amount", precision: 24, scale: 12
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gateway_id"
    t.string "gateway_identifier"
    t.string "gateway_secret"
    t.datetime "gateway_blocked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
