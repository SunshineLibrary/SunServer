class RemoveApi < ActiveRecord::Migration
  def up
    drop_table :apis
  end

  def down
    create_table :apis do |t|
      t.string :table_name
      t.string :api_path

      t.timestamps
    end
  end
end
