require 'spec_helper'

describe "station_procedureships/show.html.erb" do
  before(:each) do
    @station_procedureship = assign(:station_procedureship, stub_model(StationProcedureship,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Business Function/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Operate Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Target/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
