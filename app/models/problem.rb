# encoding: UTF-8
class Problem < ActiveRecord::Base
  has_and_belongs_to_many :quiz_activities
  has_many :problem_choices
  accepts_nested_attributes_for :problem_choices, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true

  #def save
    #problem_choices.all?(&:save)
  #end

  TYPE_TO_NAME = {"mc" => "单项选择题", "fb" => "填空题", "mamc" => "多项选择题" }
  TYPE_TO_INT = {"fb" => 0, "mc" => 1, "mamc" => 2}

  def is_mc #单选
    self.tipe == "mc"
  end

  def is_fb #填空
    self.tipe == "fb"
  end

  def is_mamc #多选
    self.tipe == "mamc"
  end

  def print_type
    TYPE_TO_NAME[self.tipe]
  end

  def problem_type
    TYPE_TO_INT[tipe]
  end

  def as_json(options = {})
    json = super(options)
    json.delete 'tipe'
    json[:problem_type] = problem_type
    return json
  end
end
