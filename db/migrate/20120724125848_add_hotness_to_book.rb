class AddHotnessToBook < ActiveRecord::Migration
  def change
    add_column :books, :hotness, :integer
  end
end
