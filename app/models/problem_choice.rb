class ProblemChoice < ActiveRecord::Base
  belongs_to :problem
  
  before_save :strip_choice
  before_save :formalize_choice_case
  
  private
  def strip_choice
    self.choice.strip!
  end
  
  private
  def formalize_choice_case
    self.choice.upcase!
  end
  
end
