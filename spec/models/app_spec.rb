#encoding: utf-8
require 'spec_helper'

describe App do
  describe "When creating an app" do
    it "cannot be created without a name" do
      App.create.should_not be_persisted
    end

    it "can be persisted with a a valid name" do
      App.create(:name => "阳光课堂").should be_persisted
    end
  end

  describe "When deleting an app" do
    it "can be hard destroyed" do
      App.create(:name => "阳光课堂").destroy
      App.first.should be_nil
    end

    it "destroys associated apk" do
      app = App.create(:name => "阳光课堂")
      app.apks.create.should be_persisted
      app.apks.create.should be_persisted
      app.destroy
      Apk.first.should be_nil
    end
  end
end
