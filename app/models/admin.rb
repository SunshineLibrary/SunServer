# encoding: UTF-8
class Admin < ActiveRecord::Base
  
  devise :database_authenticatable,
         :rememberable, :trackable, 
         :authentication_keys => [:username]
         
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
