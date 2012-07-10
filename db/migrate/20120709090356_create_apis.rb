class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :table_name
      t.string :api_path

      t.timestamps
    end
  end
end
