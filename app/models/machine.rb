class Machine < ActiveRecord::Base
  has_many :machine_signins, :order => "machine_signins.created_at DESC"
  has_many :users, :through => :machine_signins, :source => :user
  
  
end
