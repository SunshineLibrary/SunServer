class Course < ActiveRecord::Base
  belongs_to :subject
  belongs_to :provider
  has_many :chapters
  
  #[[1, "一年级"], [2, "二年级"], [3, "三年级"], [4, "四年级"], [5, "五年级"], [6, "六年级"], [7, "初一"], [8, "初二"], [9, "初三"]]
  
  def parent
    self.subject
  end
  
end
