class CreateMachineTypes < ActiveRecord::Migration
  def change
    create_table :machine_types do |t|
      t.string :size
      t.string :version

      t.timestamps
    end
  end
end
