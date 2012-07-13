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

ActiveRecord::Schema.define(:version => 20120713140746) do

  create_table "apis", :force => true do |t|
    t.string   "table_name"
    t.string   "api_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apks", :force => true do |t|
    t.string   "version"
    t.string   "name"
    t.string   "path"
    t.string   "description"
    t.integer  "permission_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apks_machine_types", :force => true do |t|
    t.integer  "apk_id"
    t.integer  "machine_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.string   "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nationality"
  end

  create_table "book_collections", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "cover_m_path"
    t.string   "cover_s_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_collections_tags", :force => true do |t|
    t.integer  "book_collection_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.integer  "author_id"
    t.string   "intro"
    t.string   "ISBN"
    t.integer  "book_collection_id"
    t.integer  "publication_year"
    t.string   "publisher"
    t.string   "cover_m_path"
    t.string   "cover_s_path"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "epub_file_file_name"
    t.string   "epub_file_content_type"
    t.integer  "epub_file_file_size"
    t.datetime "epub_file_updated_at"
  end

  create_table "books_tags", :force => true do |t|
    t.integer  "book_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machine_types", :force => true do |t|
    t.string   "size"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "intro"
    t.string   "logo_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

end
