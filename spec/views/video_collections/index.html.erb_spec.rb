require 'spec_helper'

describe "video_collections/index" do
  before(:each) do
    assign(:video_collections, [
      stub_model(VideoCollection,
        :title => "Title",
        :intro => "Intro"
      ),
      stub_model(VideoCollection,
        :title => "Title",
        :intro => "Intro"
      )
    ])
  end

  it "renders a list of video_collections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Intro".to_s, :count => 2
  end
end
