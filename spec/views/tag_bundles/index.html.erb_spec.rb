require 'spec_helper'

describe "tag_bundles/index" do
  before(:each) do
    assign(:tag_bundles, [
      stub_model(TagBundle,
        :chapter_id => 1,
        :name => "Name",
        :tags => "Tags"
      ),
      stub_model(TagBundle,
        :chapter_id => 1,
        :name => "Name",
        :tags => "Tags"
      )
    ])
  end

  it "renders a list of tag_bundles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
  end
end
