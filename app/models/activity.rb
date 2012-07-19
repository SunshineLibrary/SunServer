class Activity < ActiveRecord::Base
  has_and_belongs_to_many :sections
  has_one :text_activity
  has_one :audio_activity
  has_one :video_activity
  has_one :quiz_activity
  has_one :gallery_activity
end
