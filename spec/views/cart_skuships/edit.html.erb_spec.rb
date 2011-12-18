require 'spec_helper'

describe "cart_skuships/edit.html.erb" do
  before(:each) do
    @cart_skuship = assign(:cart_skuship, stub_model(CartSkuship,
      :sku_id => 1,
      :cart_id => 1,
      :quantity => 1,
      :order_id => 1
    ))
  end

  it "renders the edit cart_skuship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cart_skuships_path(@cart_skuship), :method => "post" do
      assert_select "input#cart_skuship_sku_id", :name => "cart_skuship[sku_id]"
      assert_select "input#cart_skuship_cart_id", :name => "cart_skuship[cart_id]"
      assert_select "input#cart_skuship_quantity", :name => "cart_skuship[quantity]"
      assert_select "input#cart_skuship_order_id", :name => "cart_skuship[order_id]"
    end
  end
end
