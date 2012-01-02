require 'spec_helper'

describe "pick_ups/new.html.erb" do
  before(:each) do
    assign(:pick_up, stub_model(PickUp,
      :name => "MyString",
      :href => "MyString"
    ).as_new_record)
  end

  it "renders new pick_up form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pick_ups_path, :method => "post" do
      assert_select "input#pick_up_name", :name => "pick_up[name]"
      assert_select "input#pick_up_href", :name => "pick_up[href]"
    end
  end
end
