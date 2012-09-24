class RemoveUsersFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :users
  end

  def down
    add_column :users, :users, :string
  end
end
