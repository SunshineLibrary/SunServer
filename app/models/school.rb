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

  def list_all_classrooms
    collection = []
    self.classrooms.each do |c|
      next if c.destroyed?
      collection << [c.class_name, c.id]
    end
    collection
  end

  def list_all_grades
    require 'set'
    collection = SortedSet.new
    self.classrooms.each do |c|
      next if c.destroyed?
      collection << c.class_of
    end
    collection
  end

  def list_all_classes_in grade
    collection = []
    self.classrooms.each do |c|
      next if c.destroyed? || (c.class_of != grade)
      collection << c
    end
    collection
  end

  def school_level_users
    self.users.where("users.user_type <> 'student'").all
  end

  def teachers
    self.users.where("users.user_type = 'teacher'").all
  end

  def students
    self.users.where("users.user_type = 'student'").all
  end
end
