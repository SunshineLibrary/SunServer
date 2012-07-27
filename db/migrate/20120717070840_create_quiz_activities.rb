class CreateQuizActivities < ActiveRecord::Migration
  def change
    create_table :quiz_activities do |t|
      t.string :name
      t.integer :activity_id
      t.integer :provider_id
      t.integer :size
      t.timestamps
    end
  end
end
