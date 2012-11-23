class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :package_name
      t.integer :latest_version

      t.timestamps
    end
  end
end
