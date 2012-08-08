require 'spec_helper'

describe "videos/edit" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :title => "MyString",
      :intro => "MyString",
      :video_collection_id => 1
    ))
  end

  it "renders the edit video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => videos_path(@video), :method => "post" do
      assert_select "input#video_title", :name => "video[title]"
      assert_select "input#video_intro", :name => "video[intro]"
      assert_select "input#video_video_collection_id", :name => "video[video_collection_id]"
    end
  end
end
