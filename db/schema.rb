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

ActiveRecord::Schema.define(version: 20140423214056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "line_one"
    t.string   "line_two"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
    t.string   "country"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advance_bookings", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.date     "booking_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experience_id"
  end

  create_table "attedees", force: true do |t|
    t.integer  "seats"
    t.integer  "user_id"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendees", force: true do |t|
    t.integer  "seats"
    t.integer  "user_id"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "email"
    t.date     "attending_date"
    t.decimal  "price"
    t.date     "attending_on"
    t.time     "attending_at"
  end

  add_index "attendees", ["experience_id"], name: "index_attendees_on_experience_id", using: :btree
  add_index "attendees", ["user_id"], name: "index_attendees_on_user_id", using: :btree

  create_table "conversations", force: true do |t|
    t.integer  "user_id"
    t.string   "sender_email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experience_id"
    t.string   "customer_name"
  end

  create_table "exp_images", force: true do |t|
    t.string   "url"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exp_images", ["experience_id"], name: "index_exp_images_on_experience_id", using: :btree

  create_table "experience_dates", force: true do |t|
    t.date     "experience_date"
    t.time     "experience_time"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experience_images", force: true do |t|
    t.string   "image"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "random_id"
    t.string   "image_type"
    t.string   "status"
  end

  create_table "experiences", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",                  precision: 15, scale: 2
    t.date     "exp_date"
    t.time     "exp_time"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "image"
    t.integer  "user_id"
    t.text     "what_does_this_include"
    t.text     "things_to_remember"
    t.integer  "max_seats"
    t.boolean  "template"
    t.string   "shortened_url"
    t.text     "summary"
    t.string   "line_one"
    t.string   "line_two"
    t.string   "state"
    t.string   "pincode"
    t.string   "country"
    t.string   "land_mark"
    t.string   "random_id"
    t.integer  "template_id"
    t.string   "tagline"
    t.string   "images"
    t.string   "category"
    t.integer  "hours"
    t.integer  "minutes"
    t.string   "slug"
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "hosts", force: true do |t|
    t.string   "title"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.integer  "user_id"
  end

  add_index "hosts", ["user_id"], name: "index_hosts_on_user_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experience_id"
  end

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "integration_tokens", force: true do |t|
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.text     "returned_values"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "post_to_fb_wall"
  end

  create_table "integrations", force: true do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", force: true do |t|
    t.integer  "user_id"
    t.integer  "potential_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experience_id"
  end

  create_table "messages", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "to"
    t.string   "from"
    t.string   "cc"
    t.string   "subject"
    t.text     "body"
    t.text     "raw_text"
    t.text     "raw_html"
    t.text     "raw_body"
    t.text     "headers"
    t.text     "raw_headers"
    t.string   "guid"
    t.integer  "conversation_id"
  end

  create_table "potentials", force: true do |t|
    t.string   "site"
    t.string   "site_type"
    t.string   "potential_type"
    t.text     "description"
    t.text     "todo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show"
  end

  create_table "shortened_urls", force: true do |t|
    t.integer  "owner_id"
    t.string   "owner_type", limit: 20
    t.string   "url",                               null: false
    t.string   "unique_key", limit: 10,             null: false
    t.integer  "use_count",             default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shortened_urls", ["owner_id", "owner_type"], name: "index_shortened_urls_on_owner_id_and_owner_type", using: :btree
  add_index "shortened_urls", ["unique_key"], name: "index_shortened_urls_on_unique_key", unique: true, using: :btree
  add_index "shortened_urls", ["url"], name: "index_shortened_urls_on_url", using: :btree

  create_table "templates", force: true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.text     "what_does_it_include"
    t.text     "things_to_remember"
    t.decimal  "price"
    t.date     "exp_date"
    t.time     "exp_time"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.string   "landmark"
    t.integer  "max_seats"
    t.string   "random_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.boolean  "host"
    t.string   "guid"
    t.string   "internal_email_id"
    t.boolean  "tour_completed"
    t.string   "subdomain"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vanity_conversions", force: true do |t|
    t.integer "vanity_experiment_id"
    t.integer "alternative"
    t.integer "conversions"
  end

  add_index "vanity_conversions", ["vanity_experiment_id", "alternative"], name: "by_experiment_id_and_alternative", using: :btree

  create_table "vanity_experiments", force: true do |t|
    t.string   "experiment_id"
    t.integer  "outcome"
    t.datetime "created_at"
    t.datetime "completed_at"
  end

  add_index "vanity_experiments", ["experiment_id"], name: "index_vanity_experiments_on_experiment_id", using: :btree

  create_table "vanity_metric_values", force: true do |t|
    t.integer "vanity_metric_id"
    t.integer "index"
    t.integer "value"
    t.string  "date"
  end

  add_index "vanity_metric_values", ["vanity_metric_id"], name: "index_vanity_metric_values_on_vanity_metric_id", using: :btree

  create_table "vanity_metrics", force: true do |t|
    t.string   "metric_id"
    t.datetime "updated_at"
  end

  add_index "vanity_metrics", ["metric_id"], name: "index_vanity_metrics_on_metric_id", using: :btree

  create_table "vanity_participants", force: true do |t|
    t.string  "experiment_id"
    t.string  "identity"
    t.integer "shown"
    t.integer "seen"
    t.integer "converted"
  end

  add_index "vanity_participants", ["experiment_id", "converted"], name: "by_experiment_id_and_converted", using: :btree
  add_index "vanity_participants", ["experiment_id", "identity"], name: "by_experiment_id_and_identity", using: :btree
  add_index "vanity_participants", ["experiment_id", "seen"], name: "by_experiment_id_and_seen", using: :btree
  add_index "vanity_participants", ["experiment_id", "shown"], name: "by_experiment_id_and_shown", using: :btree
  add_index "vanity_participants", ["experiment_id"], name: "index_vanity_participants_on_experiment_id", using: :btree

  create_table "versions", force: true do |t|
    t.decimal  "price"
    t.date     "experience_date"
    t.time     "experience_time"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_seats"
  end

end
