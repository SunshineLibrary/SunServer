class AddCoverMFileToVideo < ActiveRecord::Migration
  def up
    change_table :videos do |t|
      t.has_attached_file :cover_m
      t.has_attached_file :cover_s
      t.has_attached_file :video_file
    end
    
    change_table :video_collections do |t|
      t.has_attached_file :cover_m
      t.has_attached_file :cover_s
    end
  end
  
  def down
    drop_attached_file :videos, :cover_m
    drop_attached_file :videos, :cover_s
    drop_attached_file :videos, :video_file
    
    drop_attached_file :video_collections, :cover_m
    drop_attached_file :video_collections, :cover_s
  end
end
