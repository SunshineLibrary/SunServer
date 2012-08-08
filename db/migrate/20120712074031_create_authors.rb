class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :intro
      t.string :nationality

      t.timestamps
    end
  end
end
