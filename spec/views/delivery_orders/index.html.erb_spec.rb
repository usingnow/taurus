require 'spec_helper'

describe "delivery_orders/index.html.erb" do
  before(:each) do
    assign(:delivery_orders, [
      stub_model(DeliveryOrder,
        :order_id => 1,
        :store_id => 1,
        :administrator_id => 1
      ),
      stub_model(DeliveryOrder,
        :order_id => 1,
        :store_id => 1,
        :administrator_id => 1
      )
    ])
  end

  it "renders a list of delivery_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
