class Apk < ActiveRecord::Base
  has_and_belongs_to_many :machine_types
end
