require 'spec_helper'

describe "product_store_entryships/show.html.erb" do
  before(:each) do
    @product_store_entryship = assign(:product_store_entryship, stub_model(ProductStoreEntryship,
      :store_entry_id => 1,
      :product_id => 1,
      :quantity => 1
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
  end
end
