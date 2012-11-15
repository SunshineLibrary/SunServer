# encoding: UTF-8

class Provider < ActiveRecord::Base
  has_many :books
  has_attached_file :logo
    
  validates :name, :presence =>true
  
  ZN_NAME = "提供方"

  def self.zh_name
    ZN_NAME
  end
  
  def self.list_all
    pccollection = []
    Provider.all.each do |p|
      next if p.destroyed?
      pccollection << [p.name, p.id]
    end
    pccollection
  end
  
  def self.list_all_in_place
    pccollection = []
    Provider.all.each do |p|
      next if p.destroyed?
      pccollection << [p.id, p.name]
    end
    pccollection
  end
  
end
