require 'spec_helper'

describe "order_details/index.html.erb" do
  before(:each) do
    assign(:order_details, [
      stub_model(OrderDetail,
        :order_id => 1,
        :sku_id => 1,
        :unit_price => "9.99",
        :quantity => 1,
        :is_need_install => 1,
        :install_cost => "9.99",
        :is_need_assemble => 1,
        :assemble_cost => "9.99",
        :other_cost => "9.99",
        :created_admin_id => 1,
        :updated_admin_id => 1
      ),
      stub_model(OrderDetail,
        :order_id => 1,
        :sku_id => 1,
        :unit_price => "9.99",
        :quantity => 1,
        :is_need_install => 1,
        :install_cost => "9.99",
        :is_need_assemble => 1,
        :assemble_cost => "9.99",
        :other_cost => "9.99",
        :created_admin_id => 1,
        :updated_admin_id => 1
      )
    ])
  end

  it "renders a list of order_details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
