# encoding: UTF-8
class Chapter < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
  
  ZN_NAME = "单元"
  
  def parent
    self.course
  end
  
  def self.zh_name
    ZN_NAME
  end
  
end
