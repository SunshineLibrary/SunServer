class CreateApksMachineTypes < ActiveRecord::Migration
  def change
    create_table :apks_machine_types, :id => false do |t|
      t.integer :apk_id
      t.integer :machine_type_id

      t.timestamps
    end
  end
end
