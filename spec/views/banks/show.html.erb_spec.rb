require 'spec_helper'

describe "banks/show.html.erb" do
  before(:each) do
    @bank = assign(:bank, stub_model(Bank,
      :number => "Number",
      :account_no => "Account No",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Account No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
