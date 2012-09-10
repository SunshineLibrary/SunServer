class ChangeEverythingOnAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :organization
    change_table :admins do |t|
      t.string :username, :null => false, :default => ""
      t.integer :school_id
      t.integer :admin_type, :default => 1
    end
    add_index :admins, :username, :unique => true
  end
end