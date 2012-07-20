class AddImgFilesToGalleryActivities < ActiveRecord::Migration
  def up
    change_table :gallery_activities do |t|
      t.has_attached_file :img_files
    end
  end
  
  def down
    drop_attached_file :gallery_activities, :img_files
  end
end
