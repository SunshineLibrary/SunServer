# encoding: UTF-8
class Edge < ActiveRecord::Base
  belongs_to :section
  belongs_to :from, :class_name => "Activity"
  belongs_to :to, :class_name => "Activity"
  
  validates :section_id, :presence => true   
  
  TYPE_TO_NAME = {"CorrectCount" => "答对一定数量的题目时"}
  
  def self.type_list
    collection = []
    TYPE_TO_NAME.each do |t|
      collection << [t.second, t.first]
    end
    collection
  end
  
  def save_condition_string(condition_type, cond1, cond2)
    self.condition = Edge.generate_condition_string(condition_type, cond1, cond2)
  end

  def self.generate_condition_string(condition_type, cond1, cond2)
    case condition_type
      when "CorrectCount"
        "#{condition_type}(#{cond1}, #{cond2})"
      else
        "ERROR!"
    end
  end

end
