require 'spec_helper'

describe "images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :title => "MyString",
      :intro => "MyString",
      :gallery_activity_id => 1
    ))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path(@image), :method => "post" do
      assert_select "input#image_title", :name => "image[title]"
      assert_select "input#image_intro", :name => "image[intro]"
      assert_select "input#image_gallery_activity_id", :name => "image[gallery_activity_id]"
    end
  end
end
