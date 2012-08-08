require 'spec_helper'

describe "video_collections/edit" do
  before(:each) do
    @video_collection = assign(:video_collection, stub_model(VideoCollection,
      :title => "MyString",
      :intro => "MyString"
    ))
  end

  it "renders the edit video_collection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => video_collections_path(@video_collection), :method => "post" do
      assert_select "input#video_collection_title", :name => "video_collection[title]"
      assert_select "input#video_collection_intro", :name => "video_collection[intro]"
    end
  end
end
