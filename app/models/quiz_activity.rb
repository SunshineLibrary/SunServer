class QuizActivity < Activity
  has_many :quiz_components, :uniq => true
  has_many :problems, :through => :quiz_components, :source => :problem, :order => "quiz_components.seq", :conditions  => "problems.created_at > '#{Time.at(0)}'"

  def get_quiz_component problem
    QuizComponent.where("quiz_activity_id = '#{self.id}' AND problem_id = '#{problem.id}'").first
  end
  
  def problem_count
    self.problems.count
  end
  
  # For stats
  
  ## score that the student first did this quiz
  def get_user_first_score user
    return nil unless self.user_is_done? user
    correct = 0
    self.problems.each do |p|
      (correct = correct + 1) if p.user_did_correct_first?(user)
    end
    correct
  end
  
  def get_class_avg_score classroom
    sum = 0
    count = 0
    classroom.users.each do |u|
      if s = self.get_user_first_score(u)
        sum = sum + s
        count += 1
      end
    end
    (count > 0) ? Float(sum) / count : 0
  end
  
  def convert_to_percent score
    c = self.problem_count
    return 0 unless c > 0
    return ((score * 100) / c).round
  end
  
end
