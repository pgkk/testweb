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

ActiveRecord::Schema.define(version: 20140520152708) do

  create_table "sys_users", force: true do |t|
      t.string "name", :null => false, :limit => 20, :comment => 'user login name1'
      t.string "pwd", :null => false, :limit => 32, :comment => 'user login password'
      t.string "photo", :limit => 100, :comment => 'user photo'
      t.string "phone", :limit => 20, :comment => 'user telphone,such as 13100000000 or 023-12345678'
      t.integer "sex", :default => 0, :comment => 'user gender, Male is 0，Female is 1'
      t.datetime "created_at"
      t.datetime "updated_at"
  end

   add_index "sys_users", ["name"], name: "index_sys_users_on_name", unique: true, using: :btree

end
