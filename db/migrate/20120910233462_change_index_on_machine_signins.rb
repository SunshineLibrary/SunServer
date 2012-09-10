class ChangeIndexOnMachineSignins < ActiveRecord::Migration
  def change
    remove_index :machine_signins, :column => [:machine_id, :user_id]
    add_index :machine_signins, [:machine_id, :user_id]
  end
end