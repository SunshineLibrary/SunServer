class Activity < ActiveRecord::Base
  has_and_belongs_to_many :sections
  has_one :text_activity, :dependent => :destroy
  has_one :audio_activity, :dependent => :destroy
  has_one :video_activity, :dependent => :destroy
  has_one :quiz_activity, :dependent => :destroy
  has_one :gallery_activity, :dependent => :destroy
end
