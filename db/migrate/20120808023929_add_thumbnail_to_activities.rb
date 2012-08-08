class AddThumbnailToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.has_attached_file :thumbnail
    end
  end
end
