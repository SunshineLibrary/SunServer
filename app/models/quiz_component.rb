class QuizComponent < ActiveRecord::Base
  belongs_to :quiz_activity
  belongs_to :problem

end
