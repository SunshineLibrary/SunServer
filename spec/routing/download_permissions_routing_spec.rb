require "spec_helper"

describe DownloadPermissionsController do
  describe "routing" do

    it "routes to #index" do
      get("/download_permissions").should route_to("download_permissions#index")
    end

    it "routes to #new" do
      get("/download_permissions/new").should route_to("download_permissions#new")
    end

    it "routes to #show" do
      get("/download_permissions/1").should route_to("download_permissions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/download_permissions/1/edit").should route_to("download_permissions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/download_permissions").should route_to("download_permissions#create")
    end

    it "routes to #update" do
      put("/download_permissions/1").should route_to("download_permissions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/download_permissions/1").should route_to("download_permissions#destroy", :id => "1")
    end

  end
end
