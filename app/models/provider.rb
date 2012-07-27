class Provider < ActiveRecord::Base
  has_many :books
  has_attached_file :logo
    
  validates :name, :presence =>true
  
  def self.provider_list
    pccollection = []
    Provider.all.each do |p|
      pccollection << [p.name, p.id]
    end
    pccollection
  end
end
