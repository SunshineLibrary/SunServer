require "spec_helper"

describe ApksController do
  describe "routing" do

    it "routes to #index" do
      get("/apks").should route_to("apks#index")
    end

    it "routes to #new" do
      get("/apks/new").should route_to("apks#new")
    end

    it "routes to #show" do
      get("/apks/1").should route_to("apks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/apks/1/edit").should route_to("apks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/apks").should route_to("apks#create")
    end

    it "routes to #update" do
      put("/apks/1").should route_to("apks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/apks/1").should route_to("apks#destroy", :id => "1")
    end

  end
end
