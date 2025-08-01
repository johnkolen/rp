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

ActiveRecord::Schema[8.0].define(version: 2025_07_31_173727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "assetable_type"
    t.integer "assetable_id"
    t.string "name"
    t.decimal "value"
    t.string "notes"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id", null: false
    t.index ["person_id"], name: "index_assets_on_person_id"
  end

  create_table "checking_accounts", force: :cascade do |t|
    t.decimal "interest_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employments", force: :cascade do |t|
    t.decimal "gross"
    t.integer "taxable_status_id"
    t.boolean "ssi"
    t.decimal "raise_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "expenseable_type"
    t.integer "expenseable_id"
    t.string "name"
    t.decimal "amount"
    t.string "notes"
    t.string "location"
    t.integer "frequency_id"
    t.date "start_date"
    t.date "final_date", default: "2199-12-31"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_expenses_on_person_id"
  end

  create_table "fixed_rate_mortgages", force: :cascade do |t|
    t.decimal "pi_payment"
    t.decimal "interest_rate"
    t.bigint "property_id", null: false
    t.date "final_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_fixed_rate_mortgages_on_property_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.string "incomeable_type"
    t.integer "incomeable_id"
    t.string "name"
    t.decimal "amount"
    t.string "notes"
    t.string "location"
    t.date "start_date"
    t.date "final_date", default: "2199-12-31"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_incomes_on_person_id"
  end

  create_table "liabilities", force: :cascade do |t|
    t.string "liabilityable_type"
    t.integer "liabilityable_id"
    t.string "name"
    t.decimal "value"
    t.string "notes"
    t.string "location"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_liabilities_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.boolean "primary"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.decimal "appreciation_rate"
    t.integer "kind_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_taxes", force: :cascade do |t|
    t.decimal "increase_rate"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_taxes_on_property_id"
  end

  create_table "real_estates", force: :cascade do |t|
    t.decimal "appreciation_rate"
    t.integer "kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "savings_accounts", force: :cascade do |t|
    t.decimal "interest_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_securities", force: :cascade do |t|
    t.decimal "benefit_at_62"
    t.decimal "benefit_at_67"
    t.decimal "benefit_at_70"
    t.date "retirement_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assets", "people"
  add_foreign_key "expenses", "people"
  add_foreign_key "fixed_rate_mortgages", "properties"
  add_foreign_key "incomes", "people"
  add_foreign_key "liabilities", "people"
  add_foreign_key "people", "users"
  add_foreign_key "property_taxes", "properties"
end
