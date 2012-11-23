class CreateApks < ActiveRecord::Migration
  def change
    create_table :apks do |t|
      t.string :version
      t.string :name
      t.string :description
      t.has_attached_file :file 

      t.timestamps
    end
  end
end
