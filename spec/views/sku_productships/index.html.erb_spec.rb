require 'spec_helper'

describe "sku_productships/index.html.erb" do
  before(:each) do
    assign(:sku_productships, [
      stub_model(SkuProductship,
        :sku_id => 1,
        :product_id => 1,
        :package_name => "Package Name",
        :package_num => 1,
        :sales_bef_tax => "9.99",
        :sales_aft_tax => "9.99",
        :is_main => false,
        :created_by => "Created By",
        :updated_by => "Updated By"
      ),
      stub_model(SkuProductship,
        :sku_id => 1,
        :product_id => 1,
        :package_name => "Package Name",
        :package_num => 1,
        :sales_bef_tax => "9.99",
        :sales_aft_tax => "9.99",
        :is_main => false,
        :created_by => "Created By",
        :updated_by => "Updated By"
      )
    ])
  end

  it "renders a list of sku_productships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Package Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
  end
end
