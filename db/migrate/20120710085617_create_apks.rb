class CreateApks < ActiveRecord::Migration
  def change
    create_table :apks do |t|
      t.string :version
      t.string :name
      t.string :path
      t.string :description
      t.integer :permission_level

      t.timestamps
    end
  end
end
