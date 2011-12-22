require 'spec_helper'

describe "admin/stations/show.html.erb" do
  before(:each) do
    @admin_station = assign(:admin_station, stub_model(Admin::Station,
      :name => "Name",
      :display_name => "Display Name",
      :condition_function => "Condition Function",
      :business_function => "Business Function",
      :station_type => 1,
      :sequence => 1,
      :safe_quantity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Display Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Condition Function/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Business Function/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
