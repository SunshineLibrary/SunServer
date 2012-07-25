class RenameClassColumnForUser < ActiveRecord::Migration
  def change
    rename_column :users, :class, :classroom
  end
end
