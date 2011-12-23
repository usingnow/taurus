require 'spec_helper'

describe "station_procedureships/index.html.erb" do
  before(:each) do
    assign(:station_procedureships, [
      stub_model(StationProcedureship,
        :procedure_id => 1,
        :station_id => 1,
        :condition => 1,
        :next_station_id => 1,
        :business_function => "Business Function",
        :operate_url => "Operate Url",
        :target => "Target",
        :width => 1,
        :height => 1,
        :active => false,
        :sequence => 1,
        :sub_sequence => 1
      ),
      stub_model(StationProcedureship,
        :procedure_id => 1,
        :station_id => 1,
        :condition => 1,
        :next_station_id => 1,
        :business_function => "Business Function",
        :operate_url => "Operate Url",
        :target => "Target",
        :width => 1,
        :height => 1,
        :active => false,
        :sequence => 1,
        :sub_sequence => 1
      )
    ])
  end

  it "renders a list of station_procedureships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Business Function".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Operate Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Target".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
