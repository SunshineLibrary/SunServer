class CreateQuizComponents < ActiveRecord::Migration
  def change
    create_table :quiz_components do |t|
      t.integer :quiz_activity_id
      t.integer :problem_id
      t.integer :order
      
      t.timestamps
    end
  end
end