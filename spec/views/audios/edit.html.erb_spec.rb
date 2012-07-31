require 'spec_helper'

describe "audios/edit" do
  before(:each) do
    @audio = assign(:audio, stub_model(Audio,
      :title => "MyString",
      :intro => "MyString",
      :audio_collection_id => 1
    ))
  end

  it "renders the edit audio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => audios_path(@audio), :method => "post" do
      assert_select "input#audio_title", :name => "audio[title]"
      assert_select "input#audio_intro", :name => "audio[intro]"
      assert_select "input#audio_audio_collection_id", :name => "audio[audio_collection_id]"
    end
  end
end
