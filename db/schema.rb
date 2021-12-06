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

ActiveRecord::Schema.define(version: 2020_08_31_073315) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_favorites_on_item_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "url", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.integer "price", null: false
    t.string "brand", null: false
    t.bigint "category_id", null: false
    t.string "size", null: false
    t.integer "sale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "order_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "item_id", null: false
    t.integer "count", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_histories_on_item_id"
    t.index ["order_id"], name: "index_order_histories_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "delivery_method", null: false
    t.string "postage", null: false
    t.bigint "credit_id", null: false
    t.bigint "user_id", null: false
    t.bigint "ship_address_id", null: false
    t.integer "total_price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_id"], name: "index_orders_on_credit_id"
    t.index ["ship_address_id"], name: "index_orders_on_ship_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "ship_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", null: false
    t.string "family_name", null: false
    t.string "first_name_kana", null: false
    t.string "family_name_kana", null: false
    t.integer "post_code", null: false
    t.integer "pref_id", null: false
    t.string "city", null: false
    t.string "address_detail", null: false
    t.string "apartment_detail", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ship_addresses_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "order_histories", "items"
  add_foreign_key "order_histories", "orders"
  add_foreign_key "orders", "credits"
  add_foreign_key "orders", "ship_addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "ship_addresses", "users"
end
