class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :course_id
      t.text :description

      t.timestamps
    end
  end
end
