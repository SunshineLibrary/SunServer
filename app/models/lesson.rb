# encoding: UTF-8
class Lesson < ActiveRecord::Base
  belongs_to :chapter
  has_many :sections, :dependent => :destroy, :conditions  => "sections.created_at > '#{Time.at(0)}'", :order => "sections.seq"
  
  ZN_NAME = "章节"
  
  def parent
    self.chapter
  end
  
  def self.zh_name
    ZN_NAME
  end
  
  def self.list_all
    collection = []
    Lesson.all.each do |l|
      next if l.destroyed?
      collection << [l.name, l.id]
    end
    collection
  end
  
end
