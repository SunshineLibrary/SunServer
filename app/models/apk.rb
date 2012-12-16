# encoding: UTF-8
class Apk < ActiveRecord::Base
  belongs_to :app

  override_destroy false
  has_attached_file :file

  validates_presence_of :app
  validate :has_valid_name

  before_validation :parse_info
  after_save :set_app_package_name

  TYPE_TO_NAME = { "release" => "发布", "test" => "测试"}

  ZN_NAME = "版本包"

  scope :latest, lambda { select('apks.id, apks.name, apks.version').
    joins("inner join (select name, max(version) as version from apks group by name) as a " +
          "on apks.name = a.name and apks.version = a.version and apks.status = 'release' " +
          "group by apks.name")}

  scope :latest_testing, lambda { select('apks.id, apks.name, apks.version').
    joins("inner join (select name, max(version) as version from apks group by name) as a " +
          "on apks.name = a.name and apks.version = a.version group by apks.name")}


  scope :latest_daemon, lambda { select('id, name, version').
    where(:status => "release", :name => "com.ssl.support.daemon").
    order('version DESC').limit(1) }

  def self.zh_name
    ZN_NAME
  end

  def print_status
    TYPE_TO_NAME[self.status]
  end

  def self.list_all_status
    collection = []
    TYPE_TO_NAME.each do |t|
      collection << [t.second, t.first]
    end
    collection
  end

  def is_release
    "release" == self.status
  end

  def set_release
    self.status = "release"
  end

  def is_test
    "test" == self.status
  end

  def set_test
    self.status = "test"
  end

  def parse_info
    if self.file.queued_for_write[:original]
      path = self.file.queued_for_write[:original].path
      res = `java -jar app/models/APKParser.jar #{path}`

      version_name_string = res.match(/versionName=\"([^\"]*)\"/)
      version_string = res.match(/versionCode=\"([^\"]*)\"/)
      name_string = res.match(/package=\"([^\"]*)\"/)

      self.version_name = version_name_string.captures[0] if version_name_string
      self.version = version_string.captures[0].to_i if version_string
      self.name = name_string.captures[0] if name_string
    end
  end

  private
  def has_valid_name
    if name and app and app.package_name
      errors.add(:base, "Apk包名称必须与App包名称相同") unless name == app.package_name
    end
  end

  def set_app_package_name
    if name and app and app.package_name != name
      app.update_attributes package_name: name
    end
  end
end
