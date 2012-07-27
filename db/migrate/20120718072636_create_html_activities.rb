class CreateHtmlActivities < ActiveRecord::Migration
  def change
    create_table :html_activities do |t|
      t.string :name
      t.integer :activity_id
      t.integer :provider_id
      t.has_attached_file :html_file

      t.timestamps
    end
  end
end
