class RemoveEditorFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :editor
  end

  def down
    add_column :courses, :editor, :string
  end
end
