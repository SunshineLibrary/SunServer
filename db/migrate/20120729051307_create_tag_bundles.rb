class CreateTagBundles < ActiveRecord::Migration
  def change
    create_table :tag_bundles do |t|
      t.integer :chapter_id
      t.string :name
      t.string :tags

      t.timestamps
    end
  end
end
