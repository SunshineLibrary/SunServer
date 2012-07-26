require 'spec_helper'

describe "classrooms/show" do
  before(:each) do
    @classroom = assign(:classroom, stub_model(Classroom,
      :name => "Name",
      :school_id => 1,
      :class_of => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
