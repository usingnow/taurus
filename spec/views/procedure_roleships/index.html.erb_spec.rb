require 'spec_helper'

describe "procedure_roleships/index.html.erb" do
  before(:each) do
    assign(:procedure_roleships, [
      stub_model(ProcedureRoleship,
        :procedure_id => 1,
        :role_id => 1
      ),
      stub_model(ProcedureRoleship,
        :procedure_id => 1,
        :role_id => 1
      )
    ])
  end

  it "renders a list of procedure_roleships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
