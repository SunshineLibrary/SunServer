class ChangeIndexOnAdmins < ActiveRecord::Migration
  def change
    remove_index :admins, :column => :email
    remove_index :admins, :column => :username
    add_index :admins, [:username, :school_id], :unique => true
  end
end