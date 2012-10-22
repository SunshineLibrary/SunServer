require 'spec_helper'

describe "PdfActivities" do
  describe "GET /pdf_activities" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get pdf_activities_path
      response.status.should be(200)
    end
  end
end
