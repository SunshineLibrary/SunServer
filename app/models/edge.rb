class Edge < ActiveRecord::Base
  belongs_to :section
  
  validates :from_id, :numericality => { :only_integer => true }
  validates :to_id, :numericality => { :only_integer => true }
  validates :section_id, :presence => true   
end
