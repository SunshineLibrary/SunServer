class AddEpubFileToBooks < ActiveRecord::Migration
  def up
    change_table :books do |t|
      t.has_attached_file :epub_file
    end
  end
  
  def down
    drop_attached_file :books, :epub_file
  end
end
