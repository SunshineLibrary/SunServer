#encoding: UTF-8

class User < ActiveRecord::Base
  belongs_to :school
  belongs_to :classroom
  has_many :machine_signins, :order => "machine_signins.created_at DESC"
  has_many :machines, :through => :machine_signins, :source => :machine
  has_many :user_records
  has_many :read_books, :through => :user_records, :source => :item, :source_type => 'Book'

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
  
  def current_machine
    self.machines.where("machine_signins.is_valid" => true).first
  end
  
  def current_signin_record
    self.machine_signins.where(is_valid: true).first
  end
  
  def User.find_by_type_school_grade_class_name_birthday(user_type, school, grade, class_order, name, birthday)
    if user_type == 'student'
      classroom = school.classrooms.where(class_of: Classroom.grade_to_class_of(grade), class_order: class_order).first
      user = classroom.users.where(name: name, birthday: birthday).first if classroom
    else
      user = User.where(school_id: school.id, user_type: user_type, name: name, birthday: birthday).first
    end
    user
  end
  
end
