require 'spec_helper'

describe "product_store_entryships/edit.html.erb" do
  before(:each) do
    @product_store_entryship = assign(:product_store_entryship, stub_model(ProductStoreEntryship,
      :store_entry_id => 1,
      :product_id => 1,
      :quantity => 1
    ))
  end

  it "renders the edit product_store_entryship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_store_entryships_path(@product_store_entryship), :method => "post" do
      assert_select "input#product_store_entryship_store_entry_id", :name => "product_store_entryship[store_entry_id]"
      assert_select "input#product_store_entryship_product_id", :name => "product_store_entryship[product_id]"
      assert_select "input#product_store_entryship_quantity", :name => "product_store_entryship[quantity]"
    end
  end
end
