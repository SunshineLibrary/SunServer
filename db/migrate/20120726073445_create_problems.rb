class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :body
      t.string :tipe
      t.string :answer

      t.timestamps
    end
  end
end
