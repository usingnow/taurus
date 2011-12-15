require 'spec_helper'

describe "sku_categories/index.html.erb" do
  before(:each) do
    assign(:sku_categories, [
      stub_model(SkuCategory,
        :root_id => 1,
        :parent_in => 1,
        :number => "Number",
        :name => "Name",
        :description => "MyText",
        :is_show_in_navigation => false,
        :is_show_in_column => false,
        :active => false,
        :create_by => "Create By",
        :update_by => "Update By"
      ),
      stub_model(SkuCategory,
        :root_id => 1,
        :parent_in => 1,
        :number => "Number",
        :name => "Name",
        :description => "MyText",
        :is_show_in_navigation => false,
        :is_show_in_column => false,
        :active => false,
        :create_by => "Create By",
        :update_by => "Update By"
      )
    ])
  end

  it "renders a list of sku_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Create By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Update By".to_s, :count => 2
  end
end
