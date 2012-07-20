class AddVidFileToVideoActivities < ActiveRecord::Migration
  def up
    change_table :video_activities do |t|
      t.has_attached_file :vid_file
    end
  end
  
  def down
    drop_attached_file :video_activities, :vid_file
  end
end
