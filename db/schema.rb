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

ActiveRecord::Schema.define(version: 2022_06_25_054516) do

  create_table "accounts", force: :cascade do |t|
    t.float "balance"
    t.integer "phone"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "item_name"
    t.integer "phone"
    t.float "price"
    t.integer "item_id"
    t.string "business_name"
    t.string "image"
    t.string "description"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text_massage"
    t.string "sender"
    t.string "receiver"
    t.string "type"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.integer "phone"
    t.string "image"
    t.string "password"
  end

end
