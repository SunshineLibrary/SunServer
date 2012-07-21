class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.integer :from_id
      t.integer :to_id
      t.integer :section_id
      t.string :condition

      t.timestamps
    end
  end
end
