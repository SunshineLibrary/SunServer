class ChangeNotesFromStringToTextOnActivites < ActiveRecord::Migration
  def up
    remove_column :activities, :notes
    add_column :activities, :notes, :text
  end

  def down
    remove_column :activities, :notes
    add_column :activities, :notes, :string
  end
end
