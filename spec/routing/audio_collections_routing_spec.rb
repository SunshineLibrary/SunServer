require "spec_helper"

describe AudioCollectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/audio_collections").should route_to("audio_collections#index")
    end

    it "routes to #new" do
      get("/audio_collections/new").should route_to("audio_collections#new")
    end

    it "routes to #show" do
      get("/audio_collections/1").should route_to("audio_collections#show", :id => "1")
    end

    it "routes to #edit" do
      get("/audio_collections/1/edit").should route_to("audio_collections#edit", :id => "1")
    end

    it "routes to #create" do
      post("/audio_collections").should route_to("audio_collections#create")
    end

    it "routes to #update" do
      put("/audio_collections/1").should route_to("audio_collections#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/audio_collections/1").should route_to("audio_collections#destroy", :id => "1")
    end

  end
end
