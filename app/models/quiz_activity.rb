class QuizActivity < ActiveRecord::Base
  belongs_to :activity
  has_and_belongs_to_many :problems
  
  def order= ord
    if self.activity
      self.activity.order = ord
      self.activity.save
    else
      self.build_activity order:ord, tipe:"quiz"
    end
  end
  
  def order
    if self.activity
      return self.activity.order
    else
      return
    end
  end
end
