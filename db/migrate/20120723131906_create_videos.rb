class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :intro
      t.integer :video_collection_id

      t.timestamps
    end
  end
end
