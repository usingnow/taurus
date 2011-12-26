require 'spec_helper'

describe "procedure_roleships/show.html.erb" do
  before(:each) do
    @procedure_roleship = assign(:procedure_roleship, stub_model(ProcedureRoleship,
      :procedure_id => 1,
      :role_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
