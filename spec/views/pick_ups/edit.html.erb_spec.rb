require 'spec_helper'

describe "pick_ups/edit.html.erb" do
  before(:each) do
    @pick_up = assign(:pick_up, stub_model(PickUp,
      :name => "MyString",
      :href => "MyString"
    ))
  end

  it "renders the edit pick_up form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pick_ups_path(@pick_up), :method => "post" do
      assert_select "input#pick_up_name", :name => "pick_up[name]"
      assert_select "input#pick_up_href", :name => "pick_up[href]"
    end
  end
end
