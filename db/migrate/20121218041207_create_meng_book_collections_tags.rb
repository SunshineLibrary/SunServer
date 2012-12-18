class CreateMengBookCollectionsTags < ActiveRecord::Migration
  def up
    create_table :meng_book_collections_tags do |t|
      t.integer :book_collection_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :meng_book_collections_tags, :book_collection_id
    add_index :meng_book_collections_tags, :tag_id

    #Union data in
    require 'set'
    for collection in BookCollection.all
      tag_ids_set = Set.new
      for book in collection.books
        book.tag_ids.each {|id| tag_ids_set << id}
      end

      for temp_tag_id in tag_ids_set
        MengBookCollectionsTags.create book_collection_id: collection.id, tag_id: temp_tag_id
      end
    end
  end

  def down
    drop_table :meng_book_collections_tags
  end
end
