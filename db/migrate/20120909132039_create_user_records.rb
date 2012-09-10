class CreateUserRecords < ActiveRecord::Migration
  def change
    create_table :user_records do |t|
      t.integer :user_id, :null => false
      t.integer :item_id, :null => false
      t.string :item_type, :null => false
      t.string :field1
      t.string :field2
      
      t.timestamps
    end
    add_index :user_records, [:user_id, :item_id, :item_type], :unique => true
  end
end
