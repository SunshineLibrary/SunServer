class Section < ActiveRecord::Base
  belongs_to :lesson
  has_and_belongs_to_many :activities
  has_many :edges
  
end