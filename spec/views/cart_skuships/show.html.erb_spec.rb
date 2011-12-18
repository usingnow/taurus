require 'spec_helper'

describe "cart_skuships/show.html.erb" do
  before(:each) do
    @cart_skuship = assign(:cart_skuship, stub_model(CartSkuship,
      :sku_id => 1,
      :cart_id => 1,
      :quantity => 1,
      :order_id => 1
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
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
