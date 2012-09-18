class Apk < ActiveRecord::Base

  scope :latest, lambda { select('apks.id, apks.name, apks.version').
    joins('inner join (select name, max(version) as version from apks group by name) as a on apks.name = a.name and apks.version = a.version') }

  has_attached_file :file

  def parse_info
    res = `java -jar app/models/APKParser.jar #{file.path}`

    self.version_name = res.match(/versionName=\"([^\"]*)\"/).captures[0]
    self.version = res.match(/versionCode=\"([^\"]*)\"/).captures[0].to_i
    self.name = res.match(/package=\"([^\"]*)\"/).captures[0]

    #self.save
    # self.description = self.file.path
  end
end
