# encoding: UTF-8
class Admin < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, 
         :authentication_keys => [:username]
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :name, :admin_type
  
  belongs_to :school
  
  ZN_NAME = "管理员"
  
  def self.zh_name
    ZN_NAME
  end
  
  def email_required?
    false
  end

  def print_permission(field)
    if eval("self.#{field}")
      "是"
    else
      "否"
    end  
  end
end
