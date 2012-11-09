require 'spec_helper'

describe "download_permissions/index" do
  before(:each) do
    assign(:download_permissions, [
      stub_model(DownloadPermission,
        :owner_id => 1,
        :owner_type => "Owner Type",
        :resource_id => 2,
        :resource_type => "Resource Type",
        :permission_boolean => false
      ),
      stub_model(DownloadPermission,
        :owner_id => 1,
        :owner_type => "Owner Type",
        :resource_id => 2,
        :resource_type => "Resource Type",
        :permission_boolean => false
      )
    ])
  end

  it "renders a list of download_permissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Owner Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Resource Type".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
