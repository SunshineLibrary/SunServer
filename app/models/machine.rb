# encoding: UTF-8
class Machine < ActiveRecord::Base
  belongs_to :machine_type
  has_many :machine_signins, :order => "machine_signins.created_at DESC"
  has_many :users, :through => :machine_signins, :source => :user
  
  ZN_NAME = "科目"
  
  def self.zh_name
    ZN_NAME
  end
  
  def current_user
    self.users.where("machine_signins.is_valid" => true).first
  end
  
  def current_signin_record
    self.machine_signins.where(is_valid: true).first
  end
  
  def last_signin_record
    self.machine_signins.where(is_valid: false).order("signed_out_at DESC").first
  end
  
  def last_user
    self.last_signin_record.user
  end
  
  def lock
    self.is_locked = true
  end
  
  def unlock
    self.is_locked = false
  end
  
end
