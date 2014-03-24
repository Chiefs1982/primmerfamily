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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140320170929) do

  create_table "articles", :force => true do |t|
    t.string   "article_header"
    t.text     "article_body"
    t.integer  "article_id"
    t.string   "article_link"
    t.boolean  "article_pics"
    t.boolean  "article_video"
    t.boolean  "top_pics"
    t.string   "article_tags"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "articles", ["article_id"], :name => "index_articles_on_article_id"

  create_table "birthdays", :force => true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "month"
    t.integer  "day"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["article_id"], :name => "index_comments_on_article_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "body"
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "counters", :force => true do |t|
    t.integer  "hit_counter"
    t.string   "session_hash"
    t.string   "ip_address"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "counters", ["hit_counter"], :name => "index_counters_on_hit_counter"

  create_table "newsletters", :force => true do |t|
    t.string   "email"
    t.string   "forgot_pw"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pic_of_the_months", :force => true do |t|
    t.string   "picmonth_file_name"
    t.string   "picmonth_content_type"
    t.integer  "picmonth_file_size"
    t.datetime "picmonth_updated_at"
    t.integer  "month"
    t.integer  "year"
    t.text     "title"
  end

  create_table "pictures", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "article_id"
    t.string   "picture_title"
    t.integer  "toppic",               :default => 0
  end

  add_index "pictures", ["article_id"], :name => "index_pictures_on_article_id"

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "username"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "user_file_name"
    t.string   "user_content_type"
    t.integer  "user_file_size"
    t.datetime "user_updated_at"
    t.boolean  "newsletter",         :default => false
    t.boolean  "admin",              :default => false
    t.boolean  "super_user",         :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "user_id"
    t.string   "forgot_pw"
  end

  add_index "users", ["user_id"], :name => "index_users_on_user_id"
  add_index "users", ["username"], :name => "index_users_on_username"

end
