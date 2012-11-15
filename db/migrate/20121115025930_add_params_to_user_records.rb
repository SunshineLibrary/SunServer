class AddParamsToUserRecords < ActiveRecord::Migration
  def up
    add_column :user_records, :params, :string, :default => ""
    add_column :user_records, :timestamp, :integer, :default => 0
    remove_column :user_records, :field1
    remove_column :user_records, :field2
  end

  def down
    remove_column :user_records, :params
    remove_column :user_records, :timestamp
    add_column :user_records, :field1, :string
    add_column :user_records, :field2, :string
  end
end
