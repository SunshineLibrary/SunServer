# encoding: UTF-8
class Problem < ActiveRecord::Base
  has_many :problem_choices
  
  accepts_nested_attributes_for :problem_choices
  
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
    case self.tipe
      when "mc"
        "单项选择题"
      when "fb"
        "填空题"
      when "mamc"
        "多项选择题"
      else
        "未知"
    end
  end

end
