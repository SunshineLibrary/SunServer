class Apk < ActiveRecord::Base
  has_attached_file :file
  
  def parse_info    
    res = `java -jar app/models/APKParser.jar #{file.path}`
    
    self.version = res.match(/versionName=\"([^\"]*)\"/).captures[0]
    self.name = res.match(/package=\"([^\"]*)\"/).captures[0]
    
    self.save
    # self.description = self.file.path
  end
end
