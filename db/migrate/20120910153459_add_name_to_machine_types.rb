class AddNameToMachineTypes < ActiveRecord::Migration
  def change
    change_table :machine_types do |t|
      t.string :name
      t.remove :version
      t.string :android_version
    end
  end
end