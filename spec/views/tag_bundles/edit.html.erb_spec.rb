require 'spec_helper'

describe "tag_bundles/edit" do
  before(:each) do
    @tag_bundle = assign(:tag_bundle, stub_model(TagBundle,
      :chapter_id => 1,
      :name => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders the edit tag_bundle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tag_bundles_path(@tag_bundle), :method => "post" do
      assert_select "input#tag_bundle_chapter_id", :name => "tag_bundle[chapter_id]"
      assert_select "input#tag_bundle_name", :name => "tag_bundle[name]"
      assert_select "input#tag_bundle_tags", :name => "tag_bundle[tags]"
    end
  end
end
