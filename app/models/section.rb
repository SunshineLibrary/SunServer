class Section < ActiveRecord::Base
  belongs_to :lesson
  has_many :edges
  has_many :section_components, :uniq => true
  has_many :activities, :through => :section_components, :source => :activity, :order => "'section_components.order'"
    
  def parent
    self.lesson
  end
  
  def set_order(activity, order)
    ActivitiesSections.find_by_activity_and_section(activity.id, self.id).order = order
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