class App < ActiveRecord::Base
  has_many :apks, :dependent => :destroy

  validates_presence_of :name

  override_destroy false
end
