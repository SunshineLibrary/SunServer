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

ActiveRecord::Schema.define(:version => 20120907153459) do

  create_table "activities", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "provider_id"
    t.string   "notes"
    t.integer  "duration"
    t.string   "content_file_file_name"
    t.string   "content_file_content_type"
    t.integer  "content_file_file_size"
    t.datetime "content_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "name"
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
    t.string   "username",               :default => "",    :null => false
    t.integer  "school_id"
    t.integer  "admin_type",             :default => 1
    t.boolean  "is_global",              :default => false, :null => false
    t.boolean  "is_manager",             :default => false, :null => false
    t.boolean  "is_super",               :default => false, :null => false
  end

  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true
  add_index "admins", ["username"], :name => "index_admins_on_username", :unique => true

  create_table "apks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
    t.string   "version_name"
  end

  create_table "apks_machine_types", :id => false, :force => true do |t|
    t.integer  "apk_id"
    t.integer  "machine_type_id"
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
    t.text     "intro"
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
    t.string   "course_type"
  end

  create_table "edges", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "section_id"
    t.string   "condition"
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

  create_table "machine_signins", :force => true do |t|
    t.integer  "machine_id",                   :null => false
    t.integer  "user_id",                      :null => false
    t.integer  "is_valid",      :default => 0, :null => false
    t.string   "access_token"
    t.datetime "signed_out_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "machine_signins", ["access_token"], :name => "index_machine_signins_on_access_token", :unique => true
  add_index "machine_signins", ["machine_id", "user_id"], :name => "index_machine_signins_on_machine_id_and_user_id", :unique => true

  create_table "machine_types", :force => true do |t|
    t.string   "size"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines", :force => true do |t|
    t.string   "unique_id",                          :null => false
    t.string   "machine_type_id",                    :null => false
    t.boolean  "is_locked",       :default => false, :null => false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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

  create_table "quiz_components", :force => true do |t|
    t.integer  "quiz_activity_id"
    t.integer  "problem_id"
    t.integer  "seq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_components", :force => true do |t|
    t.integer  "section_id"
    t.integer  "activity_id"
    t.integer  "seq"
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
    t.string   "bundle_type"
    t.string   "tags_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "tag_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "users"
    t.string   "name"
    t.date     "birthday"
    t.integer  "classroom_id"
    t.integer  "school_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name", "birthday", "classroom_id"], :name => "index_users_on_name_and_birthday_and_classroom_id", :unique => true

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
