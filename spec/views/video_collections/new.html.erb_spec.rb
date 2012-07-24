require 'spec_helper'

describe "video_collections/new" do
  before(:each) do
    assign(:video_collection, stub_model(VideoCollection,
      :title => "MyString",
      :intro => "MyString"
    ).as_new_record)
  end

  it "renders new video_collection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => video_collections_path, :method => "post" do
      assert_select "input#video_collection_title", :name => "video_collection[title]"
      assert_select "input#video_collection_intro", :name => "video_collection[intro]"
    end
  end
end
