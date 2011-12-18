require 'spec_helper'

describe "orders/index.html.erb" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :name => "Name",
        :address => "Address",
        :email => "Email",
        :pay_type => "Pay Type"
      ),
      stub_model(Order,
        :name => "Name",
        :address => "Address",
        :email => "Email",
        :pay_type => "Pay Type"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pay Type".to_s, :count => 2
  end
end
