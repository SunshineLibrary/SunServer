require 'spec_helper'

describe "audio_collections/new" do
  before(:each) do
    assign(:audio_collection, stub_model(AudioCollection,
      :title => "MyString",
      :intro => "MyString"
    ).as_new_record)
  end

  it "renders new audio_collection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => audio_collections_path, :method => "post" do
      assert_select "input#audio_collection_title", :name => "audio_collection[title]"
      assert_select "input#audio_collection_intro", :name => "audio_collection[intro]"
    end
  end
end
