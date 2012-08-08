# encoding: UTF-8
class Lesson < ActiveRecord::Base
  belongs_to :chapter
  has_many :sections, :conditions  => "sections.created_at > '#{Time.at(0)}'"
  
  ZN_NAME = "章节"
  
  def parent
    self.chapter
  end
  
  def self.zh_name
    ZN_NAME
  end
  
end
