# encoding: UTF-8
class Activity < ActiveRecord::Base

  has_many :section_components, :dependent => :destroy
  has_many :user_record, :as => :item
  has_many :users, :through => :user_records

  has_attached_file :content_file, {
    :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
    :url => "/system/:attachment/:id/:style/:hash.:extension",
    :hash_secret => "longSecretString"
  }

  has_attached_file :thumbnail, {
    :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
    :url => "/system/:attachment/:id/:style/:hash.:extension",
    :hash_secret => "longSecretString"
  }

  has_attached_file :modified_file1
  has_attached_file :modified_file2

  TYPE_TO_NAME = {"video" => "视频", "audio" => "音频", "quiz"=>"习题", "html" => "网页", "pdf" => "PDF", "text" => "文字"}
  TYPE_TO_INT =  {"TextActivity" => 0, "AudioActivity" => 1, "VideoActivity" => 2, "GalleryActivity" => 3,
    "QuizActivity" => 4, "HtmlActivity" => 5, "PdfActivity" => 6}

  ZN_NAME = "活动"

  def self.zh_name
    ZN_NAME
  end

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

  # for UserRecord
  
  def user_is_done? user
    if ur = UserRecord.get_first_record(user.id, self.id, "Activity")
      h = ur.get_params_as_hash
      return h["status"] == "done"
    else
      return false
    end
  end
  
  def count_done_user_in_class classroom
    count = 0
    classroom.users.each do |u|
      if self.user_is_done? u
        count += 1
      end
    end
    count
  end
  

  ###
  # for PDF
  ###
  def is_pdf
    "pdf" == self.tipe
  end

  def get_pdf_file(machine_type)
    if machine_type.size == "800*480"
      self.modified_file1.url
    else
      self.modified_file2.url
    end
  end

end
