require 'spec_helper'

describe "product_categories/show.html.erb" do
  before(:each) do
    @product_category = assign(:product_category, stub_model(ProductCategory,
      :parent_id => "",
      :number => "Number",
      :name => "Name",
      :description => "MyText",
      :create_by => "Create By",
      :update_by => "Update By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Create By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Update By/)
  end
end
