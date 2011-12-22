require 'spec_helper'

describe "admin/stations/index.html.erb" do
  before(:each) do
    assign(:admin_stations, [
      stub_model(Admin::Station,
        :name => "Name",
        :display_name => "Display Name",
        :condition_function => "Condition Function",
        :business_function => "Business Function",
        :station_type => 1,
        :sequence => 1,
        :safe_quantity => 1
      ),
      stub_model(Admin::Station,
        :name => "Name",
        :display_name => "Display Name",
        :condition_function => "Condition Function",
        :business_function => "Business Function",
        :station_type => 1,
        :sequence => 1,
        :safe_quantity => 1
      )
    ])
  end

  it "renders a list of admin/stations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Display Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Condition Function".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Business Function".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
