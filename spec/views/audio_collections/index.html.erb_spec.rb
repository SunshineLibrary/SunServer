require 'spec_helper'

describe "audio_collections/index" do
  before(:each) do
    assign(:audio_collections, [
      stub_model(AudioCollection,
        :title => "Title",
        :intro => "Intro"
      ),
      stub_model(AudioCollection,
        :title => "Title",
        :intro => "Intro"
      )
    ])
  end

  it "renders a list of audio_collections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Intro".to_s, :count => 2
  end
end
