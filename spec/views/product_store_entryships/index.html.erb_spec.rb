require 'spec_helper'

describe "product_store_entryships/index.html.erb" do
  before(:each) do
    assign(:product_store_entryships, [
      stub_model(ProductStoreEntryship,
        :store_entry_id => 1,
        :product_id => 1,
        :quantity => 1
      ),
      stub_model(ProductStoreEntryship,
        :store_entry_id => 1,
        :product_id => 1,
        :quantity => 1
      )
    ])
  end

  it "renders a list of product_store_entryships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
