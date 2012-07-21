class AddHtmlFileToHtmlActivities < ActiveRecord::Migration
  def up
    change_table :html_activities do |t|
      t.has_attached_file :html_file
    end
  end
  
  def down
    drop_attached_file :html_activities, :html_file
  end
end
