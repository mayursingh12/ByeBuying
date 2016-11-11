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

ActiveRecord::Schema.define(version: 20161111050731) do

  create_table "advertisement_images", force: :cascade do |t|
    t.integer  "advertisement_id",   limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "deleted_at"
  end

  add_index "advertisement_images", ["deleted_at"], name: "index_advertisement_images_on_deleted_at", using: :btree

  create_table "advertisements", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description",    limit: 65535
    t.datetime "start_at"
    t.datetime "end_at"
    t.float    "per_hour_cost",  limit: 24
    t.integer  "category_id",    limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "ready_for_post",               default: false
    t.boolean  "admin_verified",               default: false
    t.datetime "deleted_at"
    t.integer  "user_id",        limit: 4
    t.text     "redirect_link",  limit: 65535
    t.integer  "position",       limit: 4,     default: 1
  end

  add_index "advertisements", ["deleted_at"], name: "index_advertisements_on_deleted_at", using: :btree

  create_table "blog_images", force: :cascade do |t|
    t.integer  "blog_id",            limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "heading",     limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "icon_image_file_name",        limit: 255
    t.string   "icon_image_content_type",     limit: 255
    t.integer  "icon_image_file_size",        limit: 4
    t.datetime "icon_image_updated_at"
    t.string   "detail_image_file_name",      limit: 255
    t.string   "detail_image_content_type",   limit: 255
    t.integer  "detail_image_file_size",      limit: 4
    t.datetime "detail_image_updated_at"
    t.string   "interior_image_file_name",    limit: 255
    t.string   "interior_image_content_type", limit: 255
    t.integer  "interior_image_file_size",    limit: 4
    t.datetime "interior_image_updated_at"
    t.boolean  "is_verified",                             default: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "state_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.float    "expected_price",           limit: 24
    t.integer  "user_id",                  limit: 4
    t.string   "status",                   limit: 255
    t.integer  "product_id",               limit: 4
    t.integer  "service_id",               limit: 4
    t.boolean  "is_product"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "description",              limit: 65535
    t.float    "expected_per_hour_price",  limit: 24,    default: 0.0
    t.float    "expected_per_day_price",   limit: 24,    default: 0.0
    t.float    "expected_per_week_price",  limit: 24,    default: 0.0
    t.float    "expected_per_month_price", limit: 24,    default: 0.0
  end

  create_table "new_users", force: :cascade do |t|
    t.string   "phone",      limit: 255
    t.string   "otp",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id",         limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.integer  "category_id",             limit: 4
    t.string   "gender",                  limit: 255
    t.integer  "subcategory_id",          limit: 4
    t.text     "description",             limit: 65535
    t.text     "technical_specification", limit: 65535
    t.integer  "state_id",                limit: 4
    t.integer  "city_id",                 limit: 4
    t.text     "location",                limit: 65535
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "quantity",                limit: 4
    t.string   "rent",                    limit: 255
    t.float    "refundable_security",     limit: 24
    t.float    "cost_of_replacement",     limit: 24
    t.text     "youtube_link",            limit: 65535
    t.text     "other",                   limit: 65535
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "user_id",                 limit: 4
    t.float    "price_in_rupees",         limit: 24,    default: 0.0
    t.boolean  "negotiable",                            default: false
    t.integer  "rating",                  limit: 4,     default: 0
    t.boolean  "admin_verified",                        default: false
    t.float    "per_hour_price",          limit: 24,    default: 0.0
    t.float    "per_day_price",           limit: 24,    default: 0.0
    t.float    "per_week_price",          limit: 24,    default: 0.0
    t.float    "per_month_price",         limit: 24,    default: 0.0
    t.boolean  "is_enquired",                           default: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "number",        limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "feedback",      limit: 65535
    t.boolean  "recommand"
    t.boolean  "is_product"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "service_images", force: :cascade do |t|
    t.integer  "service_id",         limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.integer  "category_id",         limit: 4
    t.integer  "subcategory_id",      limit: 4
    t.string   "nature_of_service",   limit: 255
    t.string   "club_name",           limit: 255
    t.string   "membership_plan",     limit: 255
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "service_description", limit: 65535
    t.integer  "state_id",            limit: 4
    t.integer  "city_id",             limit: 4
    t.text     "location",            limit: 65535
    t.string   "price_type",          limit: 255
    t.text     "youtube_link",        limit: 65535
    t.text     "other",               limit: 65535
    t.float    "area_in_meters",      limit: 24
    t.text     "amenities_available", limit: 65535
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.float    "price_in_rupees",     limit: 24,    default: 0.0
    t.boolean  "negotiable",                        default: false
    t.integer  "rating",              limit: 4,     default: 0
    t.boolean  "admin_verified",                    default: false
    t.float    "per_hour_price",      limit: 24,    default: 0.0
    t.float    "per_day_price",       limit: 24,    default: 0.0
    t.float    "per_week_price",      limit: 24,    default: 0.0
    t.float    "per_month_price",     limit: 24,    default: 0.0
    t.boolean  "is_enquired",                       default: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "code",       limit: 255
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.integer  "category_id",                 limit: 4
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.boolean  "male",                                    default: false
    t.boolean  "female",                                  default: false
    t.string   "subcategory_type",            limit: 255
    t.string   "interior_image_file_name",    limit: 255
    t.string   "interior_image_content_type", limit: 255
    t.integer  "interior_image_file_size",    limit: 4
    t.datetime "interior_image_updated_at"
    t.boolean  "is_verified",                             default: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "mobile",     limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "type",                   limit: 255
    t.string   "name",                   limit: 255
    t.string   "image_file_name",        limit: 255
    t.string   "image_content_type",     limit: 255
    t.integer  "image_file_size",        limit: 4
    t.datetime "image_updated_at"
    t.datetime "deleted_at"
    t.string   "contact",                limit: 255
    t.text     "api_token",              limit: 65535
    t.text     "wish_list",              limit: 65535
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
