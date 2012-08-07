# encoding: UTF-8
class Problem < ActiveRecord::Base
  has_many :quiz_components
  
  has_many :problem_choices
  accepts_nested_attributes_for :problem_choices, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true
  
  #def save
    #problem_choices.all?(&:save)
  #end
  
  TYPE_TO_NAME = {"mc" => "单项选择题", "fb" => "填空题", "mamc" => "多项选择题" }
  
  
  def is_mc #单选
    return (self.tipe == "mc")
  end
  
  def is_fb #填空
    return (self.tipe == "fb")
  end
  
  def is_mamc #多选
    return (self.tipe == "mamc")
  end
  
  def print_type
    TYPE_TO_NAME[self.tipe]
  end
  
  def self.type_to_name(t)
    TYPE_TO_NAME[t]
  end
  
  def type_to_name(type)
    TYPE_TO_NAME[type]
  end

end
