# encoding: UTF-8
class Activity < ActiveRecord::Base

  has_many :section_components, :dependent => :destroy

  has_attached_file :content_file, {
    :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
    :url => "/system/:attachment/:id/:style/:hash.:extension",
    :hash_secret => "longSecretString"
  }

  #TYPE_TO_NAME = {"video" => "视频", "text"=>"文字", "quiz"=>"习题", "gallery"=>"图集", "audio"=> "音频", "html"=> "网页"}
  TYPE_TO_NAME = {"video" => "视频", "quiz"=>"习题" }
  TYPE_TO_INT = {"TextActivity" => 0, "AudioActivity" => 1, "VideoActivity" => 2, "GalleryActivity" => 3, "QuizActivity" => 4, "HTMLActivity" => 5}

  def self.type_to_name(t)
    TYPE_TO_NAME[t]
  end

  def type_name
    return TYPE_TO_NAME[tipe]
  end

  def tipe
    self.type[0..-9].downcase
  end

  def activity_type
    TYPE_TO_INT[type]
  end

  def as_json(options = {})
    json = super(options)
    json.delete :type
    json[:activity_type] = activity_type
    return json
  end
end
