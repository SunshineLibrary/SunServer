class MachineSignin < ActiveRecord::Base
  
  require 'digest'
  
  belongs_to :machine
  belongs_to :user
  
  SALT = "sunbookistheelevatorfortheadvancementofusruralkids"
  
  def self.find_by_machine_and_user(machine_id, user_id)
    MachineSignin.where(machine_id: machine_id, user_id: user_id).first
  end
  
  def self.calculate_access_token(machine_unique_id, user_id)
   MachineSignin.hash_method(machine_unique_id + ';' + user_id.to_s + ';' + Time.now.to_s + SALT)
  end
  
  def self.hash_method(text)
    Digest::SHA256.hexdigest(text)
  end
  
  def sign_out
    self.is_valid = false
    self.signed_out_at = Time.now
    self.save
  end
  
end
