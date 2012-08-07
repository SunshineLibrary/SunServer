class CreateTagBundles < ActiveRecord::Migration
  def change
    create_table :tag_bundles do |t|
      t.integer :chapter_id
      t.string :bundle_type
      t.string :tags_string

      t.timestamps
    end
  end
end
