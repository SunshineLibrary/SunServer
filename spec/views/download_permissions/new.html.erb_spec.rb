require 'spec_helper'

describe "download_permissions/new" do
  before(:each) do
    assign(:download_permission, stub_model(DownloadPermission,
      :owner_id => 1,
      :owner_type => "MyString",
      :resource_id => 1,
      :resource_type => "MyString",
      :permission_boolean => false
    ).as_new_record)
  end

  it "renders new download_permission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => download_permissions_path, :method => "post" do
      assert_select "input#download_permission_owner_id", :name => "download_permission[owner_id]"
      assert_select "input#download_permission_owner_type", :name => "download_permission[owner_type]"
      assert_select "input#download_permission_resource_id", :name => "download_permission[resource_id]"
      assert_select "input#download_permission_resource_type", :name => "download_permission[resource_type]"
      assert_select "input#download_permission_permission_boolean", :name => "download_permission[permission_boolean]"
    end
  end
end
