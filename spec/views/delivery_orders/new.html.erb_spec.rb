require 'spec_helper'

describe "delivery_orders/new.html.erb" do
  before(:each) do
    assign(:delivery_order, stub_model(DeliveryOrder,
      :order_id => 1,
      :store_id => 1,
      :administrator_id => 1
    ).as_new_record)
  end

  it "renders new delivery_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => delivery_orders_path, :method => "post" do
      assert_select "input#delivery_order_order_id", :name => "delivery_order[order_id]"
      assert_select "input#delivery_order_store_id", :name => "delivery_order[store_id]"
      assert_select "input#delivery_order_administrator_id", :name => "delivery_order[administrator_id]"
    end
  end
end
