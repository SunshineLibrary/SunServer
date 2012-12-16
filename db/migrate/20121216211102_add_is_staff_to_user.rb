class AddIsStaffToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_staff, :boolean, default: false, null: false
  end
end
