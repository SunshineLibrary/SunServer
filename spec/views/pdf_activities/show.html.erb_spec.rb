require 'spec_helper'

describe "pdf_activities/show" do
  before(:each) do
    @pdf_activity = assign(:pdf_activity, stub_model(PdfActivity))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
