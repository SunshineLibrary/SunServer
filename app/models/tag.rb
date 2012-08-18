class Tag < ActiveRecord::Base
  has_and_belongs_to_many :books
  has_and_belongs_to_many :book_collections
  
  validates :name, :presence => true
  
  def Tag.type_list
    Tag.select{|t| not t.destroyed?}.map{|tag| tag.tag_type}.uniq    
  end
  
  def Tag.valid_tags wantted_tag_type    
    Tag.where(tag_type: wantted_tag_type).select{|t| not t.destroyed?}    
  end
end
