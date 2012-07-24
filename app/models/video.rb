class Video < ActiveRecord::Base
  has_attached_file :video_file, {
      :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
      :url => "/system/:attachment/:id/:style/:hash.:extension",
      :hash_secret => "longSecretString"
    }
  has_attached_file :cover_m
  has_attached_file :cover_s
  belongs_to :video_collection
  
  def video_collection
    if video_collection_id and VideoCollection.find(video_collection_id)
      VideoCollection.find(video_collection_id).title
    else
      "No collection yet"
    end      
  end
end
