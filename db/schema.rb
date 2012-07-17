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

ActiveRecord::Schema.define(:version => 20120717072013) do

  create_table "activities", :force => true do |t|
    t.string   "type"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "apks_machine_types", :id => false, :force => true do |t|
    t.integer  "apk_id"
    t.integer  "machine_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audio_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.string   "file_path"
    t.text     "notes"
    t.integer  "duration"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.string   "intro"
    t.string   "nationality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_collections", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_m_file_name"
    t.string   "cover_m_content_type"
    t.integer  "cover_m_file_size"
    t.datetime "cover_m_updated_at"
    t.string   "cover_s_file_name"
    t.string   "cover_s_content_type"
    t.integer  "cover_s_file_size"
    t.datetime "cover_s_updated_at"
  end

  create_table "book_collections_tags", :id => false, :force => true do |t|
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
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "epub_file_file_name"
    t.string   "epub_file_content_type"
    t.integer  "epub_file_file_size"
    t.datetime "epub_file_updated_at"
    t.string   "cover_m_file_name"
    t.string   "cover_m_content_type"
    t.integer  "cover_m_file_size"
    t.datetime "cover_m_updated_at"
    t.string   "cover_s_file_name"
    t.string   "cover_s_content_type"
    t.integer  "cover_s_file_size"
    t.datetime "cover_s_updated_at"
    t.integer  "difficulty"
  end

  create_table "books_tags", :id => false, :force => true do |t|
    t.integer  "book_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapters", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "editor"
    t.integer  "subject_id"
    t.integer  "grade"
    t.integer  "semester"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.string   "file_path"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.string   "name"
    t.integer  "chapter_id"
    t.text     "description"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "quiz_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.string   "file_path"
    t.integer  "size"
    t.integer  "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.integer  "lesson_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "tag_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.string   "file_path"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.string   "file_path"
    t.text     "notes"
    t.integer  "duration"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
