class Course < ActiveRecord::Base
  belongs_to :subject
  belongs_to :provider
  has_many :chapters
end
