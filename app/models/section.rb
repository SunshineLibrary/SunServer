# encoding: UTF-8
class Section < ActiveRecord::Base
  belongs_to :lesson
  has_many :edges
  has_many :section_components, :uniq => true
  #has_many :activities, :through => :section_components, :source => :activity, :order => "'section_components'.'order'"
  has_many :activities, :through => :section_components

  ZN_NAME = "小节"

  def self.zh_name
    ZN_NAME
  end

  def parent
    self.lesson
  end

  def get_section_component(activity)
    SectionComponent.where("section_id = '#{self.id}' AND activity_id = '#{activity.id}'").first
  end

  def activity_list
    collection = []
    self.activities.each do |a|
      collection << [a.name, a.id]
    end
    collection
  end

  def activity_list_in_place
    collection = []
    self.activities.each do |a|
      collection << [a.id, a.name]
    end
    collection
  end

end
