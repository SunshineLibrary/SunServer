class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :intro
      t.integer :video_collection_id
    
      t.has_attached_file :cover_m
      t.has_attached_file :cover_s
      t.has_attached_file :video_file

      t.timestamps
    end
  end
end
