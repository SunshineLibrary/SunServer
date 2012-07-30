require "spec_helper"

describe AudiosController do
  describe "routing" do

    it "routes to #index" do
      get("/audios").should route_to("audios#index")
    end

    it "routes to #new" do
      get("/audios/new").should route_to("audios#new")
    end

    it "routes to #show" do
      get("/audios/1").should route_to("audios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/audios/1/edit").should route_to("audios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/audios").should route_to("audios#create")
    end

    it "routes to #update" do
      put("/audios/1").should route_to("audios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/audios/1").should route_to("audios#destroy", :id => "1")
    end

  end
end
