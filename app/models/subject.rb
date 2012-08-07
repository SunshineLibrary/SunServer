# encoding: UTF-8
class Subject < ActiveRecord::Base
  has_many :courses
  
  ZN_NAME = "科目"
    
  def self.zh_name
    ZN_NAME
  end
  
  def parent
    nil
  end
  
end
