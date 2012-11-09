require 'spec_helper'

describe "download_permissions/show" do
  before(:each) do
    @download_permission = assign(:download_permission, stub_model(DownloadPermission,
      :owner_id => 1,
      :owner_type => "Owner Type",
      :resource_id => 2,
      :resource_type => "Resource Type",
      :permission_boolean => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Owner Type/)
    rendered.should match(/2/)
    rendered.should match(/Resource Type/)
    rendered.should match(/false/)
  end
end
