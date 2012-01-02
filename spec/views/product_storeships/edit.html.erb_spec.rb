require 'spec_helper'

describe "product_storeships/edit.html.erb" do
  before(:each) do
    @product_storeship = assign(:product_storeship, stub_model(ProductStoreship,
      :store_id => 1,
      :product_id => 1,
      :quantity => 1,
      :stockout => 1
    ))
  end

  it "renders the edit product_storeship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_storeships_path(@product_storeship), :method => "post" do
      assert_select "input#product_storeship_store_id", :name => "product_storeship[store_id]"
      assert_select "input#product_storeship_product_id", :name => "product_storeship[product_id]"
      assert_select "input#product_storeship_quantity", :name => "product_storeship[quantity]"
      assert_select "input#product_storeship_stockout", :name => "product_storeship[stockout]"
    end
  end
end
