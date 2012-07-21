require 'spec_helper'

describe "edges/edit" do
  before(:each) do
    @edge = assign(:edge, stub_model(Edge,
      :from_id => 1,
      :to_id => 1,
      :section_id => 1,
      :condition => "MyString"
    ))
  end

  it "renders the edit edge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => edges_path(@edge), :method => "post" do
      assert_select "input#edge_from_id", :name => "edge[from_id]"
      assert_select "input#edge_to_id", :name => "edge[to_id]"
      assert_select "input#edge_section_id", :name => "edge[section_id]"
      assert_select "input#edge_condition", :name => "edge[condition]"
    end
  end
end
