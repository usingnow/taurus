require 'spec_helper'

describe "station_procedureships/new.html.erb" do
  before(:each) do
    assign(:station_procedureship, stub_model(StationProcedureship,
      :procedure_id => 1,
      :station_id => 1,
      :condition => 1,
      :next_station_id => 1,
      :business_function => "MyString",
      :operate_url => "MyString",
      :target => "MyString",
      :width => 1,
      :height => 1,
      :active => false,
      :sequence => 1,
      :sub_sequence => 1
    ).as_new_record)
  end

  it "renders new station_procedureship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => station_procedureships_path, :method => "post" do
      assert_select "input#station_procedureship_procedure_id", :name => "station_procedureship[procedure_id]"
      assert_select "input#station_procedureship_station_id", :name => "station_procedureship[station_id]"
      assert_select "input#station_procedureship_condition", :name => "station_procedureship[condition]"
      assert_select "input#station_procedureship_next_station_id", :name => "station_procedureship[next_station_id]"
      assert_select "input#station_procedureship_business_function", :name => "station_procedureship[business_function]"
      assert_select "input#station_procedureship_operate_url", :name => "station_procedureship[operate_url]"
      assert_select "input#station_procedureship_target", :name => "station_procedureship[target]"
      assert_select "input#station_procedureship_width", :name => "station_procedureship[width]"
      assert_select "input#station_procedureship_height", :name => "station_procedureship[height]"
      assert_select "input#station_procedureship_active", :name => "station_procedureship[active]"
      assert_select "input#station_procedureship_sequence", :name => "station_procedureship[sequence]"
      assert_select "input#station_procedureship_sub_sequence", :name => "station_procedureship[sub_sequence]"
    end
  end
end
