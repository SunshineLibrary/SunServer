class CreateBookCollectionsTags < ActiveRecord::Migration
  def change
    create_table :book_collections_tags, :id => false do |t|
      t.integer :book_collection_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
