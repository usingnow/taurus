require 'spec_helper'

describe "delivery_orders/edit.html.erb" do
  before(:each) do
    @delivery_order = assign(:delivery_order, stub_model(DeliveryOrder,
      :order_id => 1,
      :store_id => 1,
      :administrator_id => 1
    ))
  end

  it "renders the edit delivery_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => delivery_orders_path(@delivery_order), :method => "post" do
      assert_select "input#delivery_order_order_id", :name => "delivery_order[order_id]"
      assert_select "input#delivery_order_store_id", :name => "delivery_order[store_id]"
      assert_select "input#delivery_order_administrator_id", :name => "delivery_order[administrator_id]"
    end
  end
end
