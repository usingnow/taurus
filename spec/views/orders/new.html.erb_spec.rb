require 'spec_helper'

describe "orders/new.html.erb" do
  before(:each) do
    assign(:orders, stub_model(Order,
      :name => "MyString",
      :address => "MyString",
      :email => "MyString",
      :pay_type => "MyString"
    ).as_new_record)
  end

  it "renders new orders form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_name", :name => "orders[name]"
      assert_select "input#order_address", :name => "orders[address]"
      assert_select "input#order_email", :name => "orders[email]"
      assert_select "input#order_pay_type", :name => "orders[pay_type]"
    end
  end
end
