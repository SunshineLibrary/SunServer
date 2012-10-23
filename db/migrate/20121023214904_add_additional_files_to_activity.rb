class AddAdditionalFilesToActivity < ActiveRecord::Migration
  def change
    change_table :activities do |t|
        t.has_attached_file :modified_file1
        t.has_attached_file :modified_file2
    end
  end
end
