require 'spec_helper'

describe "tag_bundles/show" do
  before(:each) do
    @tag_bundle = assign(:tag_bundle, stub_model(TagBundle,
      :chapter_id => 1,
      :name => "Name",
      :tags => "Tags"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Tags/)
  end
end
