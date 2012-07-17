class CreateQuizActivities < ActiveRecord::Migration
  def change
    create_table :quiz_activities do |t|
      t.string :name
      t.integer :activity_id
      t.integer :provider_id
      t.string :file_path
      t.integer :size
      t.integer :difficulty

      t.timestamps
    end
  end
end
