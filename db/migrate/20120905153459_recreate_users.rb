class RecreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :users, :name
      t.string :users, :birthday
      t.integer :users, :classroom_id
      t.integer :users, :school_id
      t.string :users, :user_type

      t.timestamps
    end
    add_index :users, [:name, :birthday, :classroom_id], :unique => true
  end
end