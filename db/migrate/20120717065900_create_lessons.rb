class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.integer :chapter_id
      t.text :description

      t.timestamps
    end
  end
end
