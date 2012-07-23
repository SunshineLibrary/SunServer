# encoding: UTF-8
class Activity < ActiveRecord::Base
  has_and_belongs_to_many :sections
  has_one :text_activity, :dependent => :destroy
  has_one :audio_activity, :dependent => :destroy
  has_one :video_activity, :dependent => :destroy
  has_one :quiz_activity, :dependent => :destroy
  has_one :gallery_activity, :dependent => :destroy
  has_one :html_activity, :dependent => :destroy
  
  validates :order, :numericality => { :only_integer => true }
  
  TYPE_TO_NAME = {"video" => "视频", "text"=>"文本", "quiz"=>"习题", "gallery"=>"图片（集）", "audio"=> "音频", "html"=> "HTML"}
  
  def type_name
    return TYPE_TO_NAME[tipe]
  end
  
  def sub_activity
    case tipe
      when "video"
        video_activity
      when "audio"
        audio_activity
      when "text"
        text_activity
      when "quiz"
        quiz_activity
      when "gallery"
        gallery_activity
      when "html"
        html_activity
    end                 
  end  
end
