class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.text :intro
      t.string :ISBN
      t.integer :book_collection_id
      t.integer :publication_year
      t.string :publisher
      t.integer :provider_id
      t.integer :difficulty
      t.integer :hotness
      
      t.has_attached_file :epub_file
      t.has_attached_file :cover_m
      t.has_attached_file :cover_s

      t.timestamps
    end
  end
end
