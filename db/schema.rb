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

ActiveRecord::Schema.define(:version => 20120730213736) do

  create_table "activities", :force => true do |t|
    t.string   "tipe"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities_sections", :id => false, :force => true do |t|
    t.integer "activity_id"
    t.integer "section_id"
  end

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "organization"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

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
    t.string   "aud_file_file_name"
    t.string   "aud_file_content_type"
    t.integer  "aud_file_file_size"
    t.datetime "aud_file_updated_at"
    t.text     "notes"
    t.integer  "duration"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audio_collections", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "cover_m_file_name"
    t.string   "cover_m_content_type"
    t.integer  "cover_m_file_size"
    t.datetime "cover_m_updated_at"
    t.string   "cover_s_file_name"
    t.string   "cover_s_content_type"
    t.integer  "cover_s_file_size"
    t.datetime "cover_s_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audios", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.integer  "audio_collection_id"
    t.string   "cover_m_file_name"
    t.string   "cover_m_content_type"
    t.integer  "cover_m_file_size"
    t.datetime "cover_m_updated_at"
    t.string   "cover_s_file_name"
    t.string   "cover_s_content_type"
    t.integer  "cover_s_file_size"
    t.datetime "cover_s_updated_at"
    t.string   "audio_file_file_name"
    t.string   "audio_file_content_type"
    t.integer  "audio_file_file_size"
    t.datetime "audio_file_updated_at"
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
    t.string   "cover_m_file_name"
    t.string   "cover_m_content_type"
    t.integer  "cover_m_file_size"
    t.datetime "cover_m_updated_at"
    t.string   "cover_s_file_name"
    t.string   "cover_s_content_type"
    t.integer  "cover_s_file_size"
    t.datetime "cover_s_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "difficulty"
    t.integer  "hotness"
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
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.integer  "class_of"
    t.integer  "class_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "editor"
    t.integer  "subject_id"
    t.integer  "grade"
    t.string   "semester"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "edges", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "section_id"
    t.string   "condition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "html_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.string   "html_file_file_name"
    t.string   "html_file_content_type"
    t.integer  "html_file_file_size"
    t.datetime "html_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.integer  "gallery_activity_id"
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
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

  create_table "problem_choices", :force => true do |t|
    t.integer  "problem_id"
    t.string   "choice"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", :force => true do |t|
    t.string   "body"
    t.string   "tipe"
    t.string   "answer"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "intro"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_activities_problems", :id => false, :force => true do |t|
    t.integer "quiz_activity_id"
    t.integer "problem_id"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "location"
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

  create_table "tag_bundles", :force => true do |t|
    t.integer  "chapter_id"
    t.string   "name"
    t.string   "tags"
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
    t.string   "txt_file_file_name"
    t.string   "txt_file_content_type"
    t.integer  "txt_file_file_size"
    t.datetime "txt_file_updated_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
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
    t.string   "users"
    t.string   "name"
    t.string   "birthday"
    t.string   "classroom"
    t.string   "school"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "video_activities", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "provider_id"
    t.string   "vid_file_file_name"
    t.string   "vid_file_content_type"
    t.integer  "vid_file_file_size"
    t.datetime "vid_file_updated_at"
    t.text     "notes"
    t.integer  "duration"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_collections", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "cover_m_file_name"
    t.string   "cover_m_content_type"
    t.integer  "cover_m_file_size"
    t.datetime "cover_m_updated_at"
    t.string   "cover_s_file_name"
    t.string   "cover_s_content_type"
    t.integer  "cover_s_file_size"
    t.datetime "cover_s_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.integer  "video_collection_id"
    t.string   "cover_m_file_name"
    t.string   "cover_m_content_type"
    t.integer  "cover_m_file_size"
    t.datetime "cover_m_updated_at"
    t.string   "cover_s_file_name"
    t.string   "cover_s_content_type"
    t.integer  "cover_s_file_size"
    t.datetime "cover_s_updated_at"
    t.string   "video_file_file_name"
    t.string   "video_file_content_type"
    t.integer  "video_file_file_size"
    t.datetime "video_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
