class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :gallery_id
      t.integer :order
      t.text :description
      t.has_attached_file :img_file

      t.timestamps
    end
  end
end
