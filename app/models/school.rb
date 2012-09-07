  # encoding: UTF-8
class School < ActiveRecord::Base
  has_many :classrooms, :conditions  => "classrooms.created_at > '#{Time.at(0)}'"
  has_many :admins, :conditions  => "admins.created_at > '#{Time.at(0)}'"
  has_many :users, :conditions  => "users.created_at > '#{Time.at(0)}'"
  #has_many :school_level_users, :source => :users, :conditions => "NOT users.user_type = 'student'"
  
  ZN_NAME = "学校"
  
  def self.zh_name
    ZN_NAME
  end
  
  def self.list_all
    pccollection = []
    School.all.each do |p|
      next if p.destroyed?
      pccollection << [p.name, p.id]
    end
    pccollection
  end
  
  def school_level_users
    User.find(:all, :conditions => "school_id = #{self.id} AND NOT users.user_type = 'student'")
  end
  
  def teachers
    User.find(:all, :conditions => "school_id = #{self.id} AND users.user_type = 'teacher'")
  end
  
  def students
    User.find(:all, :conditions => "school_id = #{self.id} AND users.user_type = 'student'")
  end
end
