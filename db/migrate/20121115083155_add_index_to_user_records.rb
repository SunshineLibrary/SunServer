class AddIndexToUserRecords < ActiveRecord::Migration
  def up
    remove_index "user_records", :name => "index_user_records_on_user_id_and_item_id_and_item_type"
    add_index "user_records", ["user_id", "item_id", "item_type"], :name => "index_user_records_on_user_id_and_item_id_and_item_type"
  end

  def down
    remove_index "user_records", :name => "index_user_records_on_user_id_and_item_id_and_item_type"
    add_index "user_records", ["user_id", "item_id", "item_type"], :name => "index_user_records_on_user_id_and_item_id_and_item_type", :unique => true
  end
end
