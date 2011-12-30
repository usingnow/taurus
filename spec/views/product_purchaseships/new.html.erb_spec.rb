require 'spec_helper'

describe "product_purchaseships/new.html.erb" do
  before(:each) do
    assign(:product_purchaseship, stub_model(ProductPurchaseship,
      :product_id => 1,
      :purchase_id => 1,
      :quantity => 1,
      :unit_price_aft_tax => "9.99",
      :total_amount => "9.99"
    ).as_new_record)
  end

  it "renders new product_purchaseship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_purchaseships_path, :method => "post" do
      assert_select "input#product_purchaseship_product_id", :name => "product_purchaseship[product_id]"
      assert_select "input#product_purchaseship_purchase_id", :name => "product_purchaseship[purchase_id]"
      assert_select "input#product_purchaseship_quantity", :name => "product_purchaseship[quantity]"
      assert_select "input#product_purchaseship_unit_price_aft_tax", :name => "product_purchaseship[unit_price_aft_tax]"
      assert_select "input#product_purchaseship_total_amount", :name => "product_purchaseship[total_amount]"
    end
  end
end
