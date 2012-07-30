require 'spec_helper'

describe "audios/new" do
  before(:each) do
    assign(:audio, stub_model(Audio,
      :title => "MyString",
      :intro => "MyString",
      :audio_collection_id => 1
    ).as_new_record)
  end

  it "renders new audio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => audios_path, :method => "post" do
      assert_select "input#audio_title", :name => "audio[title]"
      assert_select "input#audio_intro", :name => "audio[intro]"
      assert_select "input#audio_audio_collection_id", :name => "audio[audio_collection_id]"
    end
  end
end
