require 'spec_helper'

describe "product_storeships/index.html.erb" do
  before(:each) do
    assign(:product_storeships, [
      stub_model(ProductStoreship,
        :store_id => 1,
        :product_id => 1,
        :quantity => 1,
        :stockout => 1
      ),
      stub_model(ProductStoreship,
        :store_id => 1,
        :product_id => 1,
        :quantity => 1,
        :stockout => 1
      )
    ])
  end

  it "renders a list of product_storeships" do
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
