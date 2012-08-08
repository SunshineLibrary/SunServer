class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :editor
      t.integer :subject_id
      t.integer :grade
      t.string :semester
      t.text :description

      t.timestamps
    end
  end
end
