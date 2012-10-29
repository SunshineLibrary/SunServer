class AddAudioToProblems < ActiveRecord::Migration
  def change
    change_table :problems do |t|
      t.has_attached_file :audio_file
    end
  end
end
