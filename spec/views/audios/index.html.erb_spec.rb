require 'spec_helper'

describe "audios/index" do
  before(:each) do
    assign(:audios, [
      stub_model(Audio,
        :title => "Title",
        :intro => "Intro",
        :audio_collection_id => 1
      ),
      stub_model(Audio,
        :title => "Title",
        :intro => "Intro",
        :audio_collection_id => 1
      )
    ])
  end

  it "renders a list of audios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Intro".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
