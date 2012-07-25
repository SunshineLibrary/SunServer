class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :class, :string
    add_column :users, :school, :string
    add_column :users, :user_type, :string
    
    remove_column :users, :email
  end
end
