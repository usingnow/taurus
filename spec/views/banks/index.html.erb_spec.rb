require 'spec_helper'

describe "banks/index.html.erb" do
  before(:each) do
    assign(:banks, [
      stub_model(Bank,
        :number => "Number",
        :account_no => "Account No",
        :name => "Name"
      ),
      stub_model(Bank,
        :number => "Number",
        :account_no => "Account No",
        :name => "Name"
      )
    ])
  end

  it "renders a list of banks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Account No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
