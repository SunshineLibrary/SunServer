class ProblemChoice < ActiveRecord::Base
  belongs_to :problem
  
  before_save :strip_choice
  
  private
  def strip_choice
    self.choice.strip!
  end
  
end
