class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :unique_id, :null => false
      t.string :machine_type_id, :null => false
      t.boolean :is_locked, :null => false, :default => false

      t.timestamps
    end
  end
end
