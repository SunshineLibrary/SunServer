require 'spec_helper'

describe ApksController do
  
  describe "POST update" do
    it "can parse params after post" do
      post :update, :packages => '[{"name":"apk1", "version": 1}, {"name":"apk2", "version": 2}]'
    end
  end
end
