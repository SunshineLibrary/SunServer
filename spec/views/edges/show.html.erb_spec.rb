require 'spec_helper'

describe "edges/show" do
  before(:each) do
    @edge = assign(:edge, stub_model(Edge,
      :from_id => 1,
      :to_id => 2,
      :section_id => 3,
      :condition => "Condition"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Condition/)
  end
end
