class CreateActivitiesSections < ActiveRecord::Migration
  def change
    create_table :activities_sections, :id => false do |t|
      t.integer :activity_id
      t.integer :section_id
    end
  end
end