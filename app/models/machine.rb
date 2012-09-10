class Machine < ActiveRecord::Base
  belongs_to :machine_type
  has_many :machine_signins, :order => "machine_signins.created_at DESC"
  has_many :users, :through => :machine_signins, :source => :user
  
  def current_user
    self.users.where("machine_signins.is_valid" => true).first
  end
  
  def current_signin_record
    self.machine_signins.where(is_valid: true).first
  end
  
end
