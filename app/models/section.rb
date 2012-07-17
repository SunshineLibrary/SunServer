class Section < ActiveRecord::Base
  belongs_to :lesson
  has_many :activities
end
