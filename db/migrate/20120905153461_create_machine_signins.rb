class CreateMachineSignins < ActiveRecord::Migration
  def change
    create_table :machine_signins do |t|
      t.integer :machine_id, :null => false
      t.integer :user_id, :null => false
      t.integer :is_valid, :null => false, :default => true # is this session still valid?
      t.string :access_token
      t.datetime :signed_out_at
      t.timestamps
    end
    add_index :machine_signins, [:machine_id, :user_id], :unique => true
    add_index :machine_signins, :access_token, :unique => true
  end
end