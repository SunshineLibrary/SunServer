class ChangeIsValidInMachineSignins < ActiveRecord::Migration
  def change
    change_column :machine_signins, :is_valid, :boolean, :default => true
  end
end