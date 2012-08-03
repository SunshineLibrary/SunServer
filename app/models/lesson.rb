class Lesson < ActiveRecord::Base
  belongs_to :chapter
  has_many :sections
  
  def parent
    self.chapter
  end
end
