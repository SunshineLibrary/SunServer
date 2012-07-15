class RemoveCoverPathFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :cover_m_path
    remove_column :books, :cover_s_path
  end

  def down
    add_column :books, :cover_s_path, :string
    add_column :books, :cover_m_path, :string
  end
end
