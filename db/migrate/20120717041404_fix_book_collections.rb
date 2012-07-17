class FixBookCollections < ActiveRecord::Migration
  def up
    remove_column :book_collections, :cover_m_path
    remove_column :book_collections, :cover_s_path
    
    change_table :book_collections do |t|
      t.has_attached_file :cover_m
      t.has_attached_file :cover_s
    end    
  end
  
  def down        
    drop_attached_file :book_collections, :cover_m
    drop_attached_file :book_collections, :cover_s
    
    add_column :book_collections, :cover_m_path, :string
    add_column :book_collections, :cover_s_path, :string
  end
end
