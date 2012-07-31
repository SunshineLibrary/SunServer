require 'spec_helper'

describe "audio_collections/show" do
  before(:each) do
    @audio_collection = assign(:audio_collection, stub_model(AudioCollection,
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
