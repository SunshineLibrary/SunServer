class AddImageToProblems < ActiveRecord::Migration
  def change
    change_table :problems do |t|
      t.has_attached_file :image
    end
  end
end
