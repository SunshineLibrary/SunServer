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
    collection = []
    School.all.each do |s|
      next if s.destroyed?
      collection << [s.name, s.id]
    end
    collection
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
