require 'spec_helper'

describe "pdf_activities/new" do
  before(:each) do
    assign(:pdf_activity, stub_model(PdfActivity).as_new_record)
  end

  it "renders new pdf_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pdf_activities_path, :method => "post" do
    end
  end
end
