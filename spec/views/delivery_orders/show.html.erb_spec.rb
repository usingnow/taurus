require 'spec_helper'

describe "delivery_orders/show.html.erb" do
  before(:each) do
    @delivery_order = assign(:delivery_order, stub_model(DeliveryOrder,
      :order_id => 1,
      :store_id => 1,
      :administrator_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
