require 'spec_helper'

describe "apks/new" do
  before(:each) do
    assign(:apk, stub_model(Apk,
      :version => "MyString",
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new apk form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apks_path, :method => "post" do
      assert_select "input#apk_version", :name => "apk[version]"
      assert_select "input#apk_name", :name => "apk[name]"
      assert_select "input#apk_description", :name => "apk[description]"
    end
  end
end
