class Book < ActiveRecord::Base  
  has_attached_file :epub_file, { 
    :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
    :url => "/system/:attachment/:id/:style/:hash.:extension",
    :hash_secret => "longSecretString"
  }
     
  has_attached_file :cover_m
  has_attached_file :cover_s  
  
  belongs_to :provider
  belongs_to :book_collection
  belongs_to :author  
  has_and_belongs_to_many :tags
  
  validates :title, :presence =>true  
  
  def author= name
    if name == 'Miss'
      return
    end
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
  
  def author_intro
    if author_id.nil?
      return 'Miss'
    end
    if res = Author.where(id:author_id).first
      res.intro
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
  
  def book_collection_id= bc_id
    if bc_id == "-1"    
      self.build_book_collection title:self.title, intro:self.intro
    else
      super(bc_id)            
    end
  end  
    
  def provider
    if provider_id.nil?
      return 'Miss'
    end
    if res = Provider.find(provider_id)
      res.name
    else
      'Miss'
    end
  end
  
  def update_tags new_tag_ids
    if not new_tag_ids.nil?
      self.tag_ids = new_tag_ids.map{|t| t.to_i}
      save
    end
    true
  end
  
  def Book.sequence_after (timestamp, limit)
    sorted_sequence = Book.select{|b| b.updated_at.to_i > timestamp}.sort{|a,b| a.updated_at <=> b.updated_at}
    return Book.cut(sorted_sequence, limit)
  end
  
  def Book.cut (sequence, limit)
    return sequence if sequence.count <= limit
    #sequence is longer than limit, must cut down
    i = limit
    while sequence[i] && sequence[i].updated_at == sequence[limit-1].updated_at
      i = i + 1
    end
    return sequence[0, i]
  end
end