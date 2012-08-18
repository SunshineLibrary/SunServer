class RemoveVersionFromApks < ActiveRecord::Migration
  def change
    remove_column :apks, :version
    change_table :apks do |t|
      t.integer :version
      t.string  :version_name
    end
  end
end
