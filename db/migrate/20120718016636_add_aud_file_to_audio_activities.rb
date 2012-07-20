class AddAudFileToAudioActivities < ActiveRecord::Migration
  def up
    change_table :audio_activities do |t|
      t.has_attached_file :aud_file
    end
  end
  
  def down
    drop_attached_file :audio_activities, :aud_file
  end
end
