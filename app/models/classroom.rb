# encoding: UTF-8
class Classroom < ActiveRecord::Base
  has_many :users, :conditions  => "users.created_at > '#{Time.at(0)}'"
  belongs_to :school

  ZN_NAME = "班级"

  GRADE_TO_NAME = { 1 => "一年级", 2 => "二年级", 3 => "三年级", 4 => "四年级", 5 => "五年级", 6 => "六年级", 7 => "初一", 8 => "初二", 9 => "初三" }
  ORDER_TO_NAME = { 1 => "1班", 2 => "2班", 3 => "3班", 4 => "4班", 5 => "5班", 6 => "6班" }

  def self.zh_name
    ZN_NAME
  end

  def class_name
    self.grade_name + self.order_name
  end

  def class_name_with_school
    self.school.name + self.class_name
  end

  def grade_name
    GRADE_TO_NAME[Classroom.class_of_to_grade(self.class_of)]
  end

  def self.grade_to_class_of(grade)
    (9 - grade.to_i) + Classroom.current_school_year_end_in
  end

  def self.class_of_to_grade(class_of)
    9 - (class_of.to_i - Classroom.current_school_year_end_in)
  end

  def order_name
    ORDER_TO_NAME[self.class_order]
  end

  def self.all_grades
    collection = []
    GRADE_TO_NAME.each do |g|
      collection << [g.second, g.first]
    end
    collection
  end

  def self.all_orders
    collection = []
    ORDER_TO_NAME.each do |g|
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

  def students
    self.users.where("users.user_type = 'student'").all
  end

  # calculate class_of from user input
  def self.prepare_params(params)
    # a hack here to use :class_of field temporarily store grade info from submission form, then convert back to year
    params[:class_of] = (Classroom.current_school_year_end_in + (9 - params[:class_of].to_i)).to_s
  end

  # the year that current school year end
  private
  def self.current_school_year_end_in
    if Time.now.month >= 9
      Time.now.year + 1
    else
      Time.now.year
    end
  end



end
