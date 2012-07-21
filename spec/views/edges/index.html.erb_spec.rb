require 'spec_helper'

describe "edges/index" do
  before(:each) do
    assign(:edges, [
      stub_model(Edge,
        :from_id => 1,
        :to_id => 2,
        :section_id => 3,
        :condition => "Condition"
      ),
      stub_model(Edge,
        :from_id => 1,
        :to_id => 2,
        :section_id => 3,
        :condition => "Condition"
      )
    ])
  end

  it "renders a list of edges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
  end
end
