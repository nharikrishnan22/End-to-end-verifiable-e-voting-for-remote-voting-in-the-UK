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

ActiveRecord::Schema.define(version: 2021_04_17_023808) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "auditverifications", force: :cascade do |t|
    t.string "big_ri"
    t.string "big_zi"
    t.string "g1_x"
    t.string "g1_y"
    t.string "g2_x"
    t.string "g2_y"
    t.integer "vote"
    t.string "ri"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tallyverifications", force: :cascade do |t|
    t.string "g1_x"
    t.string "g1_y"
    t.string "g2_x"
    t.string "g2_y"
    t.string "s"
    t.string "t"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.date "dateofbirth"
    t.string "firstname"
    t.string "lastname"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "big_ri"
    t.string "big_zi"
    t.string "status"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vote"
    t.string "ri"
    t.string "pwf_c_1"
    t.string "pwf_c_2"
    t.string "pwf_r_1"
    t.string "pwf_r_2"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  create_table "wellformednessverifications", force: :cascade do |t|
    t.string "c_1"
    t.string "c_2"
    t.string "r_1"
    t.string "r_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "g1_x"
    t.string "g1_y"
    t.string "g2_x"
    t.string "g2_y"
    t.string "big_ri_x"
    t.string "big_ri_y"
    t.string "big_zi_x"
    t.string "big_zi_y"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "votes", "users"
end
