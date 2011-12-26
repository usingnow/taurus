require 'spec_helper'

describe "roles/index.html.erb" do
  before(:each) do
    assign(:roles, [
      stub_model(Role,
        :number => "Number",
        :name => "Name",
        :description => "Description",
        :is_reserve => false
      ),
      stub_model(Role,
        :number => "Number",
        :name => "Name",
        :description => "Description",
        :is_reserve => false
      )
    ])
  end

  it "renders a list of roles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
