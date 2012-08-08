class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :title
      t.string :intro
      t.integer :audio_collection_id
      
      t.has_attached_file :cover_m
      t.has_attached_file :cover_s
      t.has_attached_file :audio_file

      t.timestamps
    end
  end
end
