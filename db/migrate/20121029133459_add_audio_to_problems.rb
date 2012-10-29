class AddAudioToProblems < ActiveRecord::Migration
  def up
    change_table :problems do |t|
      t.has_attached_file :audio_file
    end
  end
  
  def down
    remove_column :problems, :audio_file_file_name
    remove_column :problems, :audio_file_content_type
    remove_column :problems, :audio_file_file_size
    remove_column :problems, :audio_file_updated_at
  end
end
