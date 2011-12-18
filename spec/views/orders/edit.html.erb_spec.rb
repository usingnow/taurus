require 'spec_helper'

describe "orders/edit.html.erb" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :name => "MyString",
      :address => "MyString",
      :email => "MyString",
      :pay_type => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path(@order), :method => "post" do
      assert_select "input#order_name", :name => "order[name]"
      assert_select "input#order_address", :name => "order[address]"
      assert_select "input#order_email", :name => "order[email]"
      assert_select "input#order_pay_type", :name => "order[pay_type]"
    end
  end
end
