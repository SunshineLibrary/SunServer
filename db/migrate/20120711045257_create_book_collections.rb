class CreateBookCollections < ActiveRecord::Migration
  def change
    create_table :book_collections do |t|
      t.string :title
      t.string :intro
      t.string :cover_m_path
      t.string :cover_s_path

      t.timestamps
    end
  end
end
