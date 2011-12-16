require 'spec_helper'

describe "sku_productships/show.html.erb" do
  before(:each) do
    @sku_productship = assign(:sku_productship, stub_model(SkuProductship,
      :sku_id => 1,
      :product_id => 1,
      :package_name => "Package Name",
      :package_num => 1,
      :sales_bef_tax => "9.99",
      :sales_aft_tax => "9.99",
      :is_main => false,
      :created_by => "Created By",
      :updated_by => "Updated By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Package Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Created By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Updated By/)
  end
end
