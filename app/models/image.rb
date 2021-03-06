class Image < ActiveRecord::Base
  has_attached_file :image_file, {
    :styles => { thumb: "180x135#" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
    :url => "/system/:attachment/:id/:style/:hash.:extension",
    :hash_secret => "longSecretString"
  }

  belongs_to :gallery_activity
end
