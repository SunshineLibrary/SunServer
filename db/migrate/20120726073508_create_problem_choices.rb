class CreateProblemChoices < ActiveRecord::Migration
  def change
    create_table :problem_choices do |t|
      t.integer :problem_id
      t.string :choice
      t.string :body
      
      t.timestamps
    end
  end
end
