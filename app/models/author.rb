# encoding: UTF-8
class Author < ActiveRecord::Base
  ZN_NAME = "作者"

  def self.zh_name
    ZN_NAME
  end
end
