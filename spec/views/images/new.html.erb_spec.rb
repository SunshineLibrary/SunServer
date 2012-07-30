require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :title => "MyString",
      :intro => "MyString",
      :gallery_activity_id => 1
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path, :method => "post" do
      assert_select "input#image_title", :name => "image[title]"
      assert_select "input#image_intro", :name => "image[intro]"
      assert_select "input#image_gallery_activity_id", :name => "image[gallery_activity_id]"
    end
  end
end
