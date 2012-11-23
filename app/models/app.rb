class App < ActiveRecord::Base
  has_many :apks

  validates_presence_of :name

  override_destroy false
end
