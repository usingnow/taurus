require 'spec_helper'

describe "product_categories/index.html.erb" do
  before(:each) do
    assign(:product_categories, [
      stub_model(ProductCategory,
        :parent_id => "",
        :number => "Number",
        :name => "Name",
        :description => "MyText",
        :create_by => "Create By",
        :update_by => "Update By"
      ),
      stub_model(ProductCategory,
        :parent_id => "",
        :number => "Number",
        :name => "Name",
        :description => "MyText",
        :create_by => "Create By",
        :update_by => "Update By"
      )
    ])
  end

  it "renders a list of product_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Create By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Update By".to_s, :count => 2
  end
end
