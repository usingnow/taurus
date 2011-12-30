require 'spec_helper'

describe "ordering_companies/show.html.erb" do
  before(:each) do
    @ordering_company = assign(:ordering_company, stub_model(OrderingCompany,
      :number => "Number",
      :name => "Name",
      :address => "Address",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
  end
end
