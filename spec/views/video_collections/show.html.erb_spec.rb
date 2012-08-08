require 'spec_helper'

describe "video_collections/show" do
  before(:each) do
    @video_collection = assign(:video_collection, stub_model(VideoCollection,
      :title => "Title",
      :intro => "Intro"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Intro/)
  end
end
