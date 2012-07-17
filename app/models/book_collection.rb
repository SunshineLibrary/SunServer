class BookCollection < ActiveRecord::Base
  has_and_belongs_to_many :tags
  
  has_attached_file :cover_m
  has_attached_file :cover_s  
end
