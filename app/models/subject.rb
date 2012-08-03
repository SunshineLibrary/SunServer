class Subject < ActiveRecord::Base
  has_many :courses
  
  def parent
    nil
  end
  
end
