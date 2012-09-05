class User < ActiveRecord::Base
  has_many :machine_sign_ups, :order => "machine_sign_ups.created_at DESC"
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
  
end
