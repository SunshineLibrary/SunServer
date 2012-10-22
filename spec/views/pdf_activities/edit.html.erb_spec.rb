require 'spec_helper'

describe "pdf_activities/edit" do
  before(:each) do
    @pdf_activity = assign(:pdf_activity, stub_model(PdfActivity))
  end

  it "renders the edit pdf_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pdf_activities_path(@pdf_activity), :method => "post" do
    end
  end
end
