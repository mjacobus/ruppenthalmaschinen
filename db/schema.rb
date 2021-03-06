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

ActiveRecord::Schema.define(:version => 20130113172110) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "classifications", :force => true do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.boolean  "read"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "features", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "sequence",   :default => 0, :null => false
  end

  add_index "features", ["product_id"], :name => "index_features_on_product_id"

  create_table "pictures", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "title"
    t.text     "description"
    t.integer  "sequence"
    t.string   "file_file_name"
    t.integer  "file_file_size"
    t.string   "file_content_type"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sequence"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "application"
    t.integer  "type_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "slug"
    t.boolean  "enabled"
    t.integer  "category_id"
    t.boolean  "home"
    t.string   "video"
    t.integer  "parent_id"
    t.integer  "classification_id"
    t.text     "video_description"
  end

  add_index "products", ["classification_id"], :name => "index_products_on_classification_id"
  add_index "products", ["type_id"], :name => "index_products_on_type_id"

  create_table "services", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.boolean  "enabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "home"
  end

  create_table "snippets", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
