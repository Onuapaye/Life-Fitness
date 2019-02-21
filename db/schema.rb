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

ActiveRecord::Schema.define(version: 2019_02_15_012655) do

  create_table "active_storage_attachments", options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "activity_name", limit: 45, null: false
    t.text "activity_description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "activity_avatar_file_name"
    t.string "activity_avatar_content_type"
    t.bigint "activity_avatar_file_size"
    t.datetime "activity_avatar_updated_at"
    t.string "activity_min_duration", limit: 8, null: false
    t.string "activity_max_duration", limit: 8, null: false
    t.index ["activity_name"], name: "index_activities_on_activity_name", unique: true
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "comp_name", limit: 100, null: false
    t.string "comp_telephone", limit: 15, null: false
    t.string "comp_mobile", limit: 15
    t.text "comp_about_us", null: false
    t.string "comp_coordinate_long", null: false
    t.string "comp_coordinate_lat", null: false
    t.string "comp_address_l1", null: false
    t.string "comp_address_l2"
    t.string "comp_postal_code"
    t.string "comp_country_name", null: false
    t.string "comp_city_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comp_name"], name: "index_companies_on_comp_name", unique: true
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "role_name", limit: 45, null: false
    t.text "role_description"
    t.boolean "role_status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_name"], name: "index_roles_on_role_name", unique: true
  end

  create_table "user_activities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "user_activity_date", null: false
    t.time "user_activity_start", null: false
    t.time "user_activity_end", null: false
    t.text "user_activity_note", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_user_activities_on_activity_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_first_name", limit: 45, null: false
    t.string "user_last_name", limit: 45, null: false
    t.integer "user_age", null: false
    t.boolean "user_status", null: false
    t.string "user_telephone", limit: 10
    t.bigint "role_id"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "user_activities", "activities"
  add_foreign_key "user_activities", "users"
  add_foreign_key "users", "roles"
end
