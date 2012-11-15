# encoding: UTF-8
class MachineType < ActiveRecord::Base
  has_and_belongs_to_many :apks
  has_many :machines
  
  ZN_NAME = "机器类型"
  
  def self.zh_name
    ZN_NAME
  end
  
  def unknown_type
    MachineType.where(name: "未知").first # already created
  end
  
end
