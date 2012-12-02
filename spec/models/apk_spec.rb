require 'spec_helper'

describe Apk do
  let :app do
    FactoryGirl.create :app
  end

  describe "when creating an apk" do
    it "must be nested to an app" do
      apk = Apk.new
      apk.should_not be_valid
      apk.app = app
      apk.should be_valid
    end

    it "validates app package name" do
      app.update_attributes package_name: "com.apk"
      apk = app.apks.new :name => "com.apk2"
      apk.should_not be_valid
      apk.name = "com.apk"
      apk.should be_valid
    end

    it "sets app package name if none exists" do
      apk = app.apks.create :name => "com.new.apk"
      App.find(app.id).package_name.should == "com.new.apk"
    end
  end


  describe "when removing an apk" do
    it "can be hard destroyed" do
      apk = app.apks.create
      apk.should_not be_nil
      apk.destroy
      Apk.first.should be_nil
    end
  end
end
