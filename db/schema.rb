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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120902095023) do

  create_table "bill_points", :force => true do |t|
    t.integer  "owner_count"
    t.integer  "distance"
    t.integer  "repeater"
    t.float    "average_speed"
    t.float    "trust_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", :force => true do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "serial",     :limit => 10
    t.integer  "backnumber"
    t.integer  "year"
    t.string   "orig_loc"
    t.string   "curr_loc"
    t.string   "bank_id",                  :default => "Z"
    t.string   "group_id"
  end

  create_table "fed_banks_users", :id => false, :force => true do |t|
    t.string  "fed_bank_id"
    t.integer "user_id"
  end

  create_table "fedbank_users", :id => false, :force => true do |t|
    t.string  "fedbank_id"
    t.integer "user_id"
  end

  create_table "fedbanks", :force => true do |t|
    t.string   "bank_id"
    t.string   "primary_key"
    t.string   "name",              :default => ""
    t.integer  "num_bills_actual",  :default => 0
    t.integer  "num_bills_claimed", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", :force => true do |t|
    t.integer  "followable_id",                      :null => false
    t.string   "followable_type",                    :null => false
    t.integer  "follower_id",                        :null => false
    t.string   "follower_type",                      :null => false
    t.boolean  "blocked",         :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], :name => "fk_follows"

  create_table "groups", :force => true do |t|
    t.string   "bill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "posts", :force => true do |t|
    t.string   "user_id"
    t.string   "group_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
