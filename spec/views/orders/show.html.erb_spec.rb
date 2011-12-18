require 'spec_helper'

describe "orders/show.html.erb" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :name => "Name",
      :address => "Address",
      :email => "Email",
      :pay_type => "Pay Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pay Type/)
  end
end
