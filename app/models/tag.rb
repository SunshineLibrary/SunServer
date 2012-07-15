class Tag < ActiveRecord::Base
  has_and_belongs_to_many :books
  has_and_belongs_to_many :book_collections
  
  validates :name, :presence => true
  
  def Tag.type_list
    Tag.all.map{|tag| tag.tag_type}.uniq    
  end
end
