class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :type
      t.string :name
      t.integer :provider_id
      t.string :notes
      t.integer :duration
      t.has_attached_file :content_file
      t.timestamps
    end
  end
end
