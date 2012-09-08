#encoding: UTF-8

class User < ActiveRecord::Base
  belongs_to :school
  belongs_to :classroom
  has_many :machine_signins, :order => "machine_signins.created_at DESC"
  has_many :machines, :through => :machine_signins, :source => :machine
  
  ZN_NAME = "用户"
    
  TYPE_TO_NAME = { "student" => "学生", "teacher" => "教师", "staff" => "工作人员" }
  
  def self.zh_name
    ZN_NAME
  end
  
  def print_type
    TYPE_TO_NAME[self.user_type]
  end
  
  def machine
    self.machines.first
  end
  
  def self.all_types
    collection = []
    TYPE_TO_NAME.each do |t|
      collection << [t.second, t.first]
    end
    collection
  end
  
  def is_teacher
    self.user_type == "teacher"
  end
  
  def is_student
    self.user_type == "student"
  end
  
  def is_staff
    self.user_type == "staff"
  end
  
end
