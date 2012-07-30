class Audio < ActiveRecord::Base
  belongs_to :audio_collection
  has_attached_file :cover_m
  has_attached_file :cover_s
  
  has_attached_file :audio_file, { 
    :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
    :url => "/system/:attachment/:id/:style/:hash.:extension",
    :hash_secret => "longSecretString"
  }
  
  validates :title, :presence => true
end
