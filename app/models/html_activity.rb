class HtmlActivity < ActiveRecord::Base
  has_attached_file :html_file, { 
      :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
      :url => "/system/:attachment/:id/:style/:hash.:extension",
      :hash_secret => "longSecretString"
    }    
  
  belongs_to :activity
  
  def order= ord
    if self.activity
      self.activity.order = ord
      self.activity.save
    else
      self.build_activity order:ord, tipe:"html"
    end
  end
  
  def order
    if self.activity
      return self.activity.order
    else
      return
    end
  end
end
