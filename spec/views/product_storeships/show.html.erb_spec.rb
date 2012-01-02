require 'spec_helper'

describe "product_storeships/show.html.erb" do
  before(:each) do
    @product_storeship = assign(:product_storeship, stub_model(ProductStoreship,
      :store_id => 1,
      :product_id => 1,
      :quantity => 1,
      :stockout => 1
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
