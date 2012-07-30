require 'spec_helper'

describe "tag_bundles/new" do
  before(:each) do
    assign(:tag_bundle, stub_model(TagBundle,
      :chapter_id => 1,
      :name => "MyString",
      :tags => "MyString"
    ).as_new_record)
  end

  it "renders new tag_bundle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tag_bundles_path, :method => "post" do
      assert_select "input#tag_bundle_chapter_id", :name => "tag_bundle[chapter_id]"
      assert_select "input#tag_bundle_name", :name => "tag_bundle[name]"
      assert_select "input#tag_bundle_tags", :name => "tag_bundle[tags]"
    end
  end
end
