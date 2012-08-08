class AudioCollection < ActiveRecord::Base
  has_many :audios
  has_attached_file :cover_m
  has_attached_file :cover_s
  
  validates :title, :presence => true
end
