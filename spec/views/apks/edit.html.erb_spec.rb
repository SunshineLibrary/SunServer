require 'spec_helper'

describe "apks/edit" do
  before(:each) do
    @apk = assign(:apk, stub_model(Apk,
      :version => "MyString",
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit apk form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apks_path(@apk), :method => "post" do
      assert_select "input#apk_version", :name => "apk[version]"
      assert_select "input#apk_name", :name => "apk[name]"
      assert_select "input#apk_description", :name => "apk[description]"
    end
  end
end
