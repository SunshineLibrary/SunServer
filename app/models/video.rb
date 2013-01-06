#encoding: UTF-8

class Video < ActiveRecord::Base
  has_attached_file :video_file, {
      :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
      :url => "/system/:attachment/:id/:style/:hash.:extension",
      :hash_secret => "longSecretString"
    }
  has_attached_file :cover_m
  has_attached_file :cover_s
  belongs_to :video_collection
  validates :title, :presence => true

  ZH_NAME = "视频"

  def self.zh_name
    ZH_NAME
  end

  def video_collection
    if video_collection_id and VideoCollection.find_by_id(video_collection_id)
      VideoCollection.find_by_id(video_collection_id).title
    else
      "No collection yet"
    end
  end

  require 'tag_manager'

  def tag_param
    {:joint_class => VideosTags, :owner_key => :video_id, :id => self.id}
  end

  def tag_ids
    TagManager.tag_ids tag_param
  end

  def tags
    TagManager.tags tag_param
  end

  def update_tags new_tag_ids
    TagManager.update_tags tag_param.merge :new_tag_ids => new_tag_ids
  end
end
