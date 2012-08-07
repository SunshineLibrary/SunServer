class SectionComponent < ActiveRecord::Base
  belongs_to :section
  belongs_to :activity
end
