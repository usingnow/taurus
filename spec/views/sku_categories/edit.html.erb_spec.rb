require 'spec_helper'

describe "sku_categories/edit.html.erb" do
  before(:each) do
    @sku_category = assign(:sku_category, stub_model(SkuCategory,
      :root_id => 1,
      :parent_in => 1,
      :number => "MyString",
      :name => "MyString",
      :description => "MyText",
      :is_show_in_navigation => false,
      :is_show_in_column => false,
      :active => false,
      :create_by => "MyString",
      :update_by => "MyString"
    ))
  end

  it "renders the edit sku_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sku_categories_path(@sku_category), :method => "post" do
      assert_select "input#sku_category_root_id", :name => "sku_category[root_id]"
      assert_select "input#sku_category_parent_in", :name => "sku_category[parent_in]"
      assert_select "input#sku_category_number", :name => "sku_category[number]"
      assert_select "input#sku_category_name", :name => "sku_category[name]"
      assert_select "textarea#sku_category_description", :name => "sku_category[description]"
      assert_select "input#sku_category_is_show_in_navigation", :name => "sku_category[is_show_in_navigation]"
      assert_select "input#sku_category_is_show_in_column", :name => "sku_category[is_show_in_column]"
      assert_select "input#sku_category_active", :name => "sku_category[active]"
      assert_select "input#sku_category_create_by", :name => "sku_category[create_by]"
      assert_select "input#sku_category_update_by", :name => "sku_category[update_by]"
    end
  end
end
