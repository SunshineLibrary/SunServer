require 'spec_helper'

describe "apks/index" do
  before(:each) do
    assign(:apks, [
      stub_model(Apk,
        :version => "Version",
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Apk,
        :version => "Version",
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of apks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Version".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
