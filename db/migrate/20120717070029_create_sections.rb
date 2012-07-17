class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :lesson_id
      t.text :description

      t.timestamps
    end
  end
end
