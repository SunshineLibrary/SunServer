class AddTxtFileToTextActivities < ActiveRecord::Migration
  def up
    change_table :text_activities do |t|
      t.has_attached_file :txt_file
    end
  end
  
  def down
    drop_attached_file :text_activities, :txt_file
  end
end
