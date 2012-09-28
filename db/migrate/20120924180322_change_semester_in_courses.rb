class ChangeSemesterInCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :semester
    add_column :courses, :semester, :integer
  end

  def down
    remove_column :courses, :semester
    add_column :courses, :semester, :string
  end
end
