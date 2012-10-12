# encoding: UTF-8
class Section < ActiveRecord::Base
  belongs_to :lesson
  has_many :edges, :uniq => true, :dependent => :destroy, :conditions  => "edges.created_at > '#{Time.at(0)}'"
  has_many :section_components, :uniq => true, :dependent => :destroy, :conditions  => "section_components.created_at > '#{Time.at(0)}'"
  has_many :activities, :through => :section_components, :source => :activity, :order => "section_components.seq", :conditions  => "activities.created_at > '#{Time.at(0)}'"

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
      next if a.destroyed?
      collection << [a.name, a.id]
    end
    collection
  end

  def activity_list_in_place
    collection = []
    self.activities.each do |a|
      next if a.destroyed?
      collection << [a.id, a.name]
    end
    collection
  end

end
