class CreateVideoCollections < ActiveRecord::Migration
  def change
    create_table :video_collections do |t|
      t.string :title
      t.string :intro

      t.timestamps
    end
  end
end
