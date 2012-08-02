# encoding: UTF-8
class Activity < ActiveRecord::Base
  has_and_belongs_to_many :sections
  has_attached_file :content_file, {
      :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
      :url => "/system/:attachment/:id/:style/:hash.:extension",
      :hash_secret => "longSecretString"
    }  
  
  validates :order, :numericality => { :only_integer => true }

  TYPE_TO_NAME = {"video" => "视频", "text"=>"文本", "quiz"=>"习题", "gallery"=>"图片（集）", "audio"=> "音频", "html"=> "HTML"}

  def type_name
    return TYPE_TO_NAME[tipe]
  end
  
  def tipe
    self.type[0..-9].downcase
  end
end
