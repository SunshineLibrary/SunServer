class AddCourseTypeToCourses < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.string :course_type
    end
  end
end
