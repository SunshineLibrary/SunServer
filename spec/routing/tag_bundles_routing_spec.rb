require "spec_helper"

describe TagBundlesController do
  describe "routing" do

    it "routes to #index" do
      get("/tag_bundles").should route_to("tag_bundles#index")
    end

    it "routes to #new" do
      get("/tag_bundles/new").should route_to("tag_bundles#new")
    end

    it "routes to #show" do
      get("/tag_bundles/1").should route_to("tag_bundles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tag_bundles/1/edit").should route_to("tag_bundles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tag_bundles").should route_to("tag_bundles#create")
    end

    it "routes to #update" do
      put("/tag_bundles/1").should route_to("tag_bundles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tag_bundles/1").should route_to("tag_bundles#destroy", :id => "1")
    end

  end
end
