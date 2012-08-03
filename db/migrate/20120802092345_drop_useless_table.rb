class DropUselessTable < ActiveRecord::Migration
  def change
    drop_table :video_activities
    drop_table :audio_activities
    drop_table :html_activities
    drop_table :gallery_activities    
    drop_table :text_activities
    drop_table :quiz_activities
  end
end
