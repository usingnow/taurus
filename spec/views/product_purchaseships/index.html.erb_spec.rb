require 'spec_helper'

describe "product_purchaseships/index.html.erb" do
  before(:each) do
    assign(:product_purchaseships, [
      stub_model(ProductPurchaseship,
        :product_id => 1,
        :purchase_id => 1,
        :quantity => 1,
        :unit_price_aft_tax => "9.99",
        :total_amount => "9.99"
      ),
      stub_model(ProductPurchaseship,
        :product_id => 1,
        :purchase_id => 1,
        :quantity => 1,
        :unit_price_aft_tax => "9.99",
        :total_amount => "9.99"
      )
    ])
  end

  it "renders a list of product_purchaseships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
