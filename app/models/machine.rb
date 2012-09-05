class Machine < ActiveRecord::Base
  has_many :users, :through => :machine_signins, :source => :user
  
  
end
