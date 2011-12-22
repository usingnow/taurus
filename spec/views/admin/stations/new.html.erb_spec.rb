require 'spec_helper'

describe "admin/stations/new.html.erb" do
  before(:each) do
    assign(:admin_station, stub_model(Admin::Station,
      :name => "MyString",
      :display_name => "MyString",
      :condition_function => "MyString",
      :business_function => "MyString",
      :station_type => 1,
      :sequence => 1,
      :safe_quantity => 1
    ).as_new_record)
  end

  it "renders new admin_station form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_stations_path, :method => "post" do
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
