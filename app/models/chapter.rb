class Chapter < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
  
  def parent
    self.course
  end
end
