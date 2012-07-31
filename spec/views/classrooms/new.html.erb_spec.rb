require 'spec_helper'

describe "classrooms/new" do
  before(:each) do
    assign(:classroom, stub_model(Classroom,
      :name => "MyString",
      :school_id => 1,
      :class_of => 1
    ).as_new_record)
  end

  it "renders new classroom form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => classrooms_path, :method => "post" do
      assert_select "input#classroom_name", :name => "classroom[name]"
      assert_select "input#classroom_school_id", :name => "classroom[school_id]"
      assert_select "input#classroom_class_of", :name => "classroom[class_of]"
    end
  end
end
