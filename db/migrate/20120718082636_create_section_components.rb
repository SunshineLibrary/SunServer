class CreateSectionComponents < ActiveRecord::Migration
  def change
    create_table :section_components do |t|
      t.integer :section_id
      t.integer :activity_id
      t.integer :seq
      
      t.timestamps
    end
  end
end