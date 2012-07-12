class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.string :intro
      t.string :ISBN
      t.string :file_path
      t.integer :book_collection_id
      t.integer :publication_year
      t.string :publisher
      t.string :cover_m_path
      t.string :cover_s_path
      t.integer :provider_id      

      t.timestamps
    end
  end
end
