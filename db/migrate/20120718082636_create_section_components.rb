class CreateSectionComponents < ActiveRecord::Migration
  def change
    create_table :section_components, :id => false do |t|
      t.integer :section_id
      t.integer :activity_id
      t.integer :order
    end
  end
end