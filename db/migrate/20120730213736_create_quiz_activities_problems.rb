class CreateQuizActivitiesProblems < ActiveRecord::Migration
  def change
    create_table :quiz_activities_problems, :id => false do |t|
      t.integer :quiz_activity_id
      t.integer :problem_id
    end
  end
end