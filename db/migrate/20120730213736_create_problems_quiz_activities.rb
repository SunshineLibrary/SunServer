class CreateProblemsQuizActivities < ActiveRecord::Migration
  def change
    create_table :problems_quiz_activities, :id => false do |t|
      t.integer :quiz_activity_id
      t.integer :problem_id
    end
  end
end