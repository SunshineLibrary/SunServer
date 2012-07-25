class RemoveBirthdayFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :birthday
    
    add_column :users, :birthday, :string
  end
end
