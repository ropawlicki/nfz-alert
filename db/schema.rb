# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_10_154454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "province_codes", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "queries", force: :cascade do |t|
    t.integer "case"
    t.string "province"
    t.string "locality"
    t.string "benefit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "hash_id"
    t.index ["case", "province", "locality", "benefit"], name: "index_queries_on_case_and_province_and_locality_and_benefit", unique: true
  end

  create_table "query_results", force: :cascade do |t|
    t.bigint "query_id", null: false
    t.bigint "result_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["query_id", "result_id"], name: "index_query_results_on_query_id_and_result_id", unique: true
    t.index ["query_id"], name: "index_query_results_on_query_id"
    t.index ["result_id"], name: "index_query_results_on_result_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "benefit"
    t.string "provider"
    t.string "place"
    t.string "address"
    t.string "phone"
    t.string "toilet"
    t.string "ramp"
    t.string "car-park"
    t.string "elevator"
    t.string "locality"
    t.string "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "validated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "mailing_ready_at"
    t.index ["benefit", "provider", "place", "address"], name: "index_results_on_benefit_and_provider_and_place_and_address", unique: true
  end

  create_table "user_queries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "query_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "visited_results_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["query_id"], name: "index_user_queries_on_query_id"
    t.index ["user_id", "query_id"], name: "index_user_queries_on_user_id_and_query_id", unique: true
    t.index ["user_id"], name: "index_user_queries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "last_sent_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "query_results", "queries"
  add_foreign_key "query_results", "results"
  add_foreign_key "user_queries", "queries"
  add_foreign_key "user_queries", "users"
end
