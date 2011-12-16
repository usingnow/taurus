require 'spec_helper'

describe "sku_productships/new.html.erb" do
  before(:each) do
    assign(:sku_productship, stub_model(SkuProductship,
      :sku_id => 1,
      :product_id => 1,
      :package_name => "MyString",
      :package_num => 1,
      :sales_bef_tax => "9.99",
      :sales_aft_tax => "9.99",
      :is_main => false,
      :created_by => "MyString",
      :updated_by => "MyString"
    ).as_new_record)
  end

  it "renders new sku_productship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sku_productships_path, :method => "post" do
      assert_select "input#sku_productship_sku_id", :name => "sku_productship[sku_id]"
      assert_select "input#sku_productship_product_id", :name => "sku_productship[product_id]"
      assert_select "input#sku_productship_package_name", :name => "sku_productship[package_name]"
      assert_select "input#sku_productship_package_num", :name => "sku_productship[package_num]"
      assert_select "input#sku_productship_sales_bef_tax", :name => "sku_productship[sales_bef_tax]"
      assert_select "input#sku_productship_sales_aft_tax", :name => "sku_productship[sales_aft_tax]"
      assert_select "input#sku_productship_is_main", :name => "sku_productship[is_main]"
      assert_select "input#sku_productship_created_by", :name => "sku_productship[created_by]"
      assert_select "input#sku_productship_updated_by", :name => "sku_productship[updated_by]"
    end
  end
end
