class CreateDownloadPermissions < ActiveRecord::Migration
  def change
    create_table :download_permissions do |t|
      t.integer :owner_id
      t.string :owner_type
      t.integer :resource_id
      t.string :resource_type
      t.boolean :permission_boolean

      t.timestamps
    end
  end
end
