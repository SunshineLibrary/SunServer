class Book < ActiveRecord::Base
  belongs_to :provider
  belongs_to :book_collection
  belongs_to :author
      
  validates :title, :presence =>true  
  
  def author= name
    if res = Author.where(name:name).first
      self.author_id = res.id 
    else
      self.build_author name:name                           
    end
  end       
  
  def author
    if author_id
      Author.where(id:author_id).first.name
    else
      'Miss'
    end          
  end
end