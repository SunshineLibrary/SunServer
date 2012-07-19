class VideoActivity < ActiveRecord::Base
  belongs_to :activity
  def order= ord
    self.activity.order = ord
    self.activity.save
  end
  
  def order
    return self.activity.order
  end
end
