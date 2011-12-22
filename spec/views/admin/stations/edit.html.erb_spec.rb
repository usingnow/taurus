require 'spec_helper'

describe "admin/stations/edit.html.erb" do
  before(:each) do
    @admin_station = assign(:admin_station, stub_model(Admin::Station,
      :name => "MyString",
      :display_name => "MyString",
      :condition_function => "MyString",
      :business_function => "MyString",
      :station_type => 1,
      :sequence => 1,
      :safe_quantity => 1
    ))
  end

  it "renders the edit admin_station form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_stations_path(@admin_station), :method => "post" do
      assert_select "input#admin_station_name", :name => "admin_station[name]"
      assert_select "input#admin_station_display_name", :name => "admin_station[display_name]"
      assert_select "input#admin_station_condition_function", :name => "admin_station[condition_function]"
      assert_select "input#admin_station_business_function", :name => "admin_station[business_function]"
      assert_select "input#admin_station_station_type", :name => "admin_station[station_type]"
      assert_select "input#admin_station_sequence", :name => "admin_station[sequence]"
      assert_select "input#admin_station_safe_quantity", :name => "admin_station[safe_quantity]"
    end
  end
end
