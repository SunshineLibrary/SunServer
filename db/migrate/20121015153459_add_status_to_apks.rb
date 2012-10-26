class AddStatusToApks < ActiveRecord::Migration
  def change
    change_table :apks do |t|
      t.string :status, :default => "test"
    end
  end
end