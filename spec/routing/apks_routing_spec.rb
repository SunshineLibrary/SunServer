require "spec_helper"

describe ApksController do
  describe "routing" do
    it "routes to #index" do
      get("/apps/1/apks").should route_to("apks#index", :app_id => "1")
    end

    it "routes to #new" do
      get("/apps/1/apks/new").should route_to("apks#new", :app_id => "1")
    end

    it "routes to #show" do
      get("/apps/1/apks/1").should route_to("apks#show", :id => "1", :app_id => "1")
    end

    it "routes to #edit" do
      get("/apps/1/apks/1/edit").should route_to("apks#edit", :id => "1", :app_id => "1")
    end

    it "routes to #create" do
      post("/apps/1/apks").should route_to("apks#create", :app_id => "1")
    end

    it "routes to #update" do
      put("/apps/1/apks/1").should route_to("apks#update", :id => "1", :app_id => "1")
    end

    it "routes to #destroy" do
      delete("/apps/1/apks/1").should route_to("apks#destroy", :id => "1", :app_id => "1")
    end

    it "routes to #get_updates" do
      post("/apks/get_updates.json").should route_to("apks#get_updates", :format => "json")
    end
  end
end
