# encoding: UTF-8
class Admin < ActiveRecord::Base

  devise :database_authenticatable,
    :rememberable, :trackable,
    :authentication_keys => [:username, :school_id]

  belongs_to :school

  ZN_NAME = "后台用户"

  def self.zh_name
    ZN_NAME
  end

  def self.all
    Admin.where("admins.created_at > '#{Time.at(0)}'")
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
