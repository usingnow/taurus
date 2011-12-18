require 'spec_helper'

describe "cart_skuships/index.html.erb" do
  before(:each) do
    assign(:cart_skuships, [
      stub_model(CartSkuship,
        :sku_id => 1,
        :cart_id => 1,
        :quantity => 1,
        :order_id => 1
      ),
      stub_model(CartSkuship,
        :sku_id => 1,
        :cart_id => 1,
        :quantity => 1,
        :order_id => 1
      )
    ])
  end

  it "renders a list of cart_skuships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
