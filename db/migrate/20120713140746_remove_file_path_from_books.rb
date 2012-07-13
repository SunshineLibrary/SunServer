class RemoveFilePathFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :file_path
  end

  def down
    add_column :books, :file_path, :string
  end
end
