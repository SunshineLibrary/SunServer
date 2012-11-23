#encoding: UTF-8

require 'spec_helper'

describe "DownloadPermissions" do
  describe "Goto home page" do
    it "visit the home page" do
      visit "/"
      page.should have_content "管理员登陆"
    end
  end
end
