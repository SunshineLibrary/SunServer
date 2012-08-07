# encoding: UTF-8
class Activity < ActiveRecord::Base

  has_many :section_components

  has_attached_file :content_file, {
      :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
      :url => "/system/:attachment/:id/:style/:hash.:extension",
      :hash_secret => "longSecretString"
    }  

  TYPE_TO_NAME = {"video" => "视频", "quiz"=>"习题", "html"=> "网页", "text"=>"文字", "gallery"=>"图集", "audio"=> "音频" }

  def self.type_to_name(t)
    TYPE_TO_NAME[t]
  end

  def type_name
    return TYPE_TO_NAME[tipe]
  end
  
  def tipe
    self.type[0..-9].downcase
  end
end
