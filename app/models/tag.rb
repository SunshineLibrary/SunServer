class Tag < ActiveRecord::Base
  has_and_belongs_to_many :books
  has_and_belongs_to_many :book_collections
  
  validates :name, :presence => true
end
