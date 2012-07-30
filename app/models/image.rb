class Image < ActiveRecord::Base
  has_attached_file :image_file
  belongs_to :gallery_activity
end
