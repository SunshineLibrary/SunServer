require "spec_helper"

describe PdfActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/pdf_activities").should route_to("pdf_activities#index")
    end

    it "routes to #new" do
      get("/pdf_activities/new").should route_to("pdf_activities#new")
    end

    it "routes to #show" do
      get("/pdf_activities/1").should route_to("pdf_activities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pdf_activities/1/edit").should route_to("pdf_activities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pdf_activities").should route_to("pdf_activities#create")
    end

    it "routes to #update" do
      put("/pdf_activities/1").should route_to("pdf_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pdf_activities/1").should route_to("pdf_activities#destroy", :id => "1")
    end

  end
end
