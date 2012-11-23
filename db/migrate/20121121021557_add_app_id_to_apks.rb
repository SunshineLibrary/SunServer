class AddAppIdToApks < ActiveRecord::Migration
  def change
    add_column :apks, :app_id, :integer
  end
end
