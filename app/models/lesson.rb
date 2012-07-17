class Lesson < ActiveRecord::Base
  belongs_to :chapter
  has_many :sections
end
