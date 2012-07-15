class AddCoverPathToBooks < ActiveRecord::Migration
  def up
    change_table :books do |t|
      t.has_attached_file :cover_m
      t.has_attached_file :cover_s
    end
  end
  
  def down
    drop_attached_file :books, :cover_m
    drop_attached_file :books, :cover_s
  end
end
