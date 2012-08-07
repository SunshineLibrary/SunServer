class QuizActivity < Activity  
  has_many :quiz_components, :uniq => true
  has_many :problems, :through => :quiz_components, :source => :problem, :order => "'quiz_components.seq'"
  
  def get_quiz_component(problem)
    QuizComponent.where("quiz_activity_id = '#{self.id}' AND problem_id = '#{problem.id}'").first
  end
end
