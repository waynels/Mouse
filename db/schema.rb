# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150514080409) do

  create_table "baskets", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "batches", force: :cascade do |t|
    t.integer  "father_id",     limit: 4
    t.integer  "basket_id",     limit: 4
    t.integer  "mother_id",     limit: 4
    t.integer  "breed_id",      limit: 4
    t.integer  "quantity",      limit: 4
    t.date     "childbirthday"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "use_val",       limit: 4
  end

  create_table "breeds", force: :cascade do |t|
    t.integer  "basket_id",  limit: 4
    t.integer  "father_id",  limit: 4
    t.integer  "mother_id",  limit: 4
    t.date     "cage_at"
    t.boolean  "is_usable",  limit: 1, default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "breeds_infos", force: :cascade do |t|
    t.integer  "breed_id",       limit: 4
    t.integer  "batch_id",       limit: 4
    t.string   "operation_type", limit: 255
    t.integer  "operation_by",   limit: 4
    t.date     "operation_at"
    t.integer  "quantity",       limit: 4
    t.text     "remark",         limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "die_reason",     limit: 65535
  end

  create_table "mice", force: :cascade do |t|
    t.integer  "strain_id",      limit: 4
    t.string   "code",           limit: 255
    t.string   "generate_num",   limit: 255
    t.date     "birthday"
    t.date     "weaningday"
    t.string   "gender",         limit: 255
    t.integer  "father_id",      limit: 4
    t.string   "father_code",    limit: 255
    t.integer  "mother_id",      limit: 4
    t.string   "mother_code",    limit: 255
    t.integer  "basket_id",      limit: 4
    t.integer  "batch_id",       limit: 4
    t.string   "identification", limit: 255
    t.boolean  "is_survival",    limit: 1,                           default: true
    t.decimal  "gfp",                        precision: 8, scale: 2
    t.decimal  "gfp_val",                    precision: 8, scale: 2
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
  end

  create_table "operations", force: :cascade do |t|
    t.integer  "strain_id",    limit: 4
    t.integer  "mouse_id",     limit: 4
    t.string   "operate_type", limit: 255
    t.integer  "old_basket",   limit: 4
    t.integer  "new_basket",   limit: 4
    t.integer  "operate_by",   limit: 4
    t.date     "operate_at"
    t.text     "remark",       limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "strains", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",              limit: 255, default: ""
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
