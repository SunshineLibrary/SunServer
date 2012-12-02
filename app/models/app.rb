#encoding: utf-8
class App < ActiveRecord::Base
  has_many :apks, :dependent => :destroy

  validates_presence_of :name

  override_destroy false

  ZH_NAME = "应用"

  def self.zh_name
    ZH_NAME
  end
end
