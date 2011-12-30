require 'spec_helper'

describe "product_purchaseships/show.html.erb" do
  before(:each) do
    @product_purchaseship = assign(:product_purchaseship, stub_model(ProductPurchaseship,
      :product_id => 1,
      :purchase_id => 1,
      :quantity => 1,
      :unit_price_aft_tax => "9.99",
      :total_amount => "9.99"
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
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
