#encoding: UTF-8
class VideoCollection < ActiveRecord::Base
  has_attached_file :cover_m
  has_attached_file :cover_s
  has_many :videos

  validates :title, :presence => true

  def self.selection
    bcollection = [["自动创建", -1]]
    VideoCollection.all.each do |bc|
      next if bc.destroyed?
      bcollection<<[bc.title, bc.id]
    end
    bcollection
  end
end
