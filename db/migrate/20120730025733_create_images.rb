class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :intro
      t.integer :gallery_activity_id
      t.has_attached_file :image_file

      t.timestamps
    end
  end
end
