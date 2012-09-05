class CreateMachineSignins < ActiveRecord::Migration
  def change
    create_table :machine_sigins do |t|
      t.integer :machine_id, :null => false
      t.integer :user_id, :null => false
      t.integer :is_valid, :null => false, :default => true # is this session still valid?
      t.datetime :signed_out_at
      t.timestamps
    end
  end
end