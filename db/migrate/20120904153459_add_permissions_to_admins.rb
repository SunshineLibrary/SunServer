class AddPermissionsToAdmins < ActiveRecord::Migration
  def change
    change_table :admins do |t|
      t.boolean :is_global, :null => false, :default => false
      t.boolean :is_manager, :null => false, :default => false
      t.boolean :is_super, :null => false, :default => false
    end
  end
end