# encoding: UTF-8
class Course < ActiveRecord::Base
  belongs_to :subject
  belongs_to :provider
  has_many :chapters, :dependent => :destroy, :conditions  => "chapters.created_at > '#{Time.at(0)}'"
  
  SEMESTER_TO_NAME = { 1 => "上学期", 2 => "下学期", 3 => "全学年" }
  TYPE_TO_NAME = { "arranged" => "按部就班", "free_of_choice" => "自由选择" }
  
  ZN_NAME = "课程"
    
  def self.zh_name
    ZN_NAME
  end
  
  def parent
    self.subject
  end
  
  def print_grade
    Classroom::GRADE_TO_NAME[self.grade]
  end
  
  def print_semester
    SEMESTER_TO_NAME[self.semester]
  end
  
  def print_course_type
    TYPE_TO_NAME[self.course_type]
  end
  
  def self.all_semesters
    collection = []
    SEMESTER_TO_NAME.each do |s|
      collection << [s.second, s.first]
    end
    collection
  end
  
  # used for best_in_place select
  def self.all_semesters_in_place
    collection = []
    SEMESTER_TO_NAME.each do |s|
      collection << [s.first, s.second]
    end
    collection
  end
  
  def self.all_types
    collection = []
    TYPE_TO_NAME.each do |s|
      collection << [s.second, s.first]
    end
    collection
  end
  
  def self.all_types_in_place
    collection = []
    TYPE_TO_NAME.each do |s|
      collection << [s.first, s.second]
    end
    collection
  end
  
end
