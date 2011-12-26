require 'spec_helper'

describe "procedure_roleships/edit.html.erb" do
  before(:each) do
    @procedure_roleship = assign(:procedure_roleship, stub_model(ProcedureRoleship,
      :procedure_id => 1,
      :role_id => 1
    ))
  end

  it "renders the edit procedure_roleship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => procedure_roleships_path(@procedure_roleship), :method => "post" do
      assert_select "input#procedure_roleship_procedure_id", :name => "procedure_roleship[procedure_id]"
      assert_select "input#procedure_roleship_role_id", :name => "procedure_roleship[role_id]"
    end
  end
end
