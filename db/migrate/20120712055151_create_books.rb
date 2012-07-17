class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.string :intro
      t.string :ISBN
      t.integer :book_collection_id
      t.integer :publication_year
      t.string :publisher
      t.integer :provider_id

      t.timestamps
    end
  end
end
