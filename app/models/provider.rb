class Provider < ActiveRecord::Base
  has_many :books
  has_attached_file :logo
    
  validates :name, :presence =>true
end
