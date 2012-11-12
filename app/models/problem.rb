# encoding: UTF-8
class Problem < ActiveRecord::Base
  has_many :quiz_components
  has_many :quiz_activities, :through => :quiz_components
  has_many :problem_choices, :conditions  => "problem_choices.created_at > '#{Time.at(0)}'"
  accepts_nested_attributes_for :problem_choices, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true

  has_attached_file :image
  has_attached_file :audio_file

  before_save :strip_answer
  before_save :formalize_answer_case


  #def save
    #problem_choices.all?(&:save)
  #end

  TYPE_TO_NAME = {"mc" => "单选题", "fb" => "填空题", "mamc" => "多选题" }
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

  def self.type_to_name(t)
    TYPE_TO_NAME[t]
  end

  def type_to_name(type)
    TYPE_TO_NAME[type]
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
  
  private
  def strip_answer
    self.answer.strip! if self.answer
  end
  
  private
  def formalize_answer_case
    if self.answer and (self.is_mc or self.is_mamc)
      self.answer.upcase!
    end
  end
  
end
