class VideoCollection < ActiveRecord::Base
  has_attached_file :cover_m
  has_attached_file :cover_s
  has_many :videos
  
  validates :title, :presence => true
end
