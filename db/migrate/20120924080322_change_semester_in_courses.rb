class ChangeSemesterInCourses < ActiveRecord::Migration
  def up
    change_column :courses, :semester, :integer
    remove_column :courses, :editor
  end

  def down
    change_column :courses, :semester, :string
    add_column :course, :editor, :string
  end
end
