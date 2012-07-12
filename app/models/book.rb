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
    if author_id.nil?
      return 'Miss'
    end    
    if res = Author.where(id:author_id).first
      res.name
    else
      'Miss'
    end
  end
  
  def book_collection
    if book_collection_id.nil?
      return "Doesn't belong to any"
    end
    if res = BookCollection.where(id:book_collection_id).first
      res.title
    else
      "Doesn't belong to any"
    end  
  end
end