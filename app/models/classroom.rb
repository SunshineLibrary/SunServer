# encoding: UTF-8
class Classroom < ActiveRecord::Base
  has_many :users
  belongs_to :school
    
  GRADE_TO_NAME = { 1 => "一年级", 2 => "二年级", 3 => "三年级", 4 => "四年级", 5 => "五年级", 6 => "六年级", 7 => "初一", 8 => "初二", 9 => "初三" }
  
  def self.grade_to_name(g)
    GRADE_TO_NAME[g]
  end

  def grade_name
    return TYPE_TO_NAME[self.grade]
  end
  
  def self.all_grades
    collection = []
    GRADE_TO_NAME.each do |g|
      collection << [g.second, g.first]
    end
    collection
  end
  
  def self.all_grades_in_place
    collection = []
    GRADE_TO_NAME.each do |g|
      collection << [g.first, g.second]
    end
    collection
  end
  
end
