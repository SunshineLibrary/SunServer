require 'spec_helper'

describe "apks/show" do
  before(:each) do
    @apk = assign(:apk, stub_model(Apk,
      :version => "Version",
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Version/)
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
