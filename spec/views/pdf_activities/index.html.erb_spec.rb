require 'spec_helper'

describe "pdf_activities/index" do
  before(:each) do
    assign(:pdf_activities, [
      stub_model(PdfActivity),
      stub_model(PdfActivity)
    ])
  end

  it "renders a list of pdf_activities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
