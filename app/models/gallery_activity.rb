class GalleryActivity < Activity
  has_many :images
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image_file_file_name].blank? }, :allow_destroy => true
end
